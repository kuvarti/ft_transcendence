/*
drop database if exists transcendence;
drop user if exists client;

CREATE DATABASE transcendence;
CREATE USER client WITH PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE transcendence TO client;
ALTER USER client CREATEDB;
connect transcendence;
--*/

-- 
-- TABLES
-- 
drop table if exists blocklist;
drop table if exists banlist;
drop table if exists matches;
drop table if exists friendlist;
drop table if exists users;

create table users(
	id			serial unique not null primary key,
	username	varchar(16) unique not null check(length(username) > 2),
	email		varchar(64) unique,
	passwd		varchar(72) not null, -- bcrypt max hashed value length
	avatar		text, --image URL
	rank		integer not null check(rank >= 0 and rank <= 1000)
	-- ....
);

create table matches(
	match_id	serial unique not null primary key,
	match_date	date not null,
	match_time	time not null,
	player1		integer not null references users(id),
	p1_score	integer not null,
	player2		integer not null references users(id),
	p2_score	integer not null
);

create table friendlist(
	user1		integer not null references users(id),
	user2		integer not null references users(id),
	CHECK (user1 != user2),
	primary key(user1, user2)
);

create table blocklist(
	user1		integer not null references users(id),
	user2		integer not null references users(id),
	CHECK (user1 != user2),
	primary key(user1, user2)
);

-- 
-- Functions
-- 
drop function if exists newmatch(p1 int, p2 int, p1_s int, p2_s int);
drop function if exists uselist_combinations();

create or replace function newmatch(p1 int, p2 int, p1_s int, p2_s int)
	returns void
as $$
begin
	insert into matches (match_date, match_time, player1, p1_score, player2, p2_score) values(now()::date, now()::time, p1, p1_s, p2, p2_s);
end;
$$ language plpgsql ;

CREATE OR REPLACE FUNCTION userlist_combinations()
	RETURNS TRIGGER AS
$BODY$
BEGIN
	IF EXISTS (
		SELECT 1 FROM friendlist
		WHERE (user1 = NEW.user1 AND user2 = NEW.user2)
		OR (user1 = NEW.user2 AND user2 = NEW.user1)
	) THEN
		RAISE EXCEPTION 'Combination (%, %) already exists', NEW.user1, NEW.user2;
	END IF;
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

-- 
-- Triggers
-- 
drop trigger if exists block_duplicate_frientlist_combinations on friendlist;
drop trigger if exists block_duplicate_blocklist_combinations on blocklist;

CREATE TRIGGER block_duplicate_frientlist_combinations
BEFORE INSERT ON friendlist
FOR EACH ROW
EXECUTE FUNCTION userlist_combinations();

CREATE TRIGGER block_duplicate_blocklist_combinations
BEFORE INSERT ON blocklist
FOR EACH ROW
EXECUTE FUNCTION userlist_combinations();

-- 
-- Test Datas
-- 
-- /* Test datas!
insert into users (username, rank, passwd) values
	('kuvarti', 1000, 'hashedpasswd'),
	('pro', 999, 'hashedpasswd'),
	('normal player', 500, 'hashedpasswd'),
	('noob', 10, 'hashedpasswd');

select newmatch(1, 2, 5, 3);
select newmatch(3, 4, 2, 1);

select newmatch(2, 3, 3, 5);
select newmatch(4, 1, 1, 2);

select newmatch(1, 3, 4, 4);
select newmatch(2, 4, 2, 2);

INSERT INTO friendlist (user1, user2) VALUES
	(1, 2),
	(2, 3);
--insert into friendlist (user1, user2) values (3, 2);

Insert into blocklist (user1, user2) values
	(1, 3);

select * from users;
select * from matches;
select * from friendlist;
select u1.username as player1, u2.username as player2, matches.match_date, matches.match_time
from matches, users as u1, users as u2
where matches.player1 = u1.id and matches.player2 = u2.id;
--*/