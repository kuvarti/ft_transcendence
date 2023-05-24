/*
drop database if exists transcendence;
drop user if exists client;

create database transcendence;
create user client with PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE transcendence TO client;
ALTER ROLE client CREATEDB;
USE transcendence;
--*/

drop table if exists matches;
drop table if exists friendlist;
drop table if exists users;
drop type if exists winner;
drop function if exists addmatch(p1 int, p2 int, p1_s int, p2_s int);

create table users(
	id			serial unique not null primary key,
	username	varchar(16) unique not null check(length(username) > 2),
	rank		integer not null check(rank >= 0 and rank <= 1000),
	passwd		varchar(72) not null-- bcrypt max hashed value length
	-- ....
);

create table matches(
	match_id	serial unique not null primary key,
	player1		integer not null references users(id),
	p1_score	integer not null,
	player2		integer not null references users(id),
	p2_score	integer not null,
	m_winner	integer check(m_winner = player1 or m_winner = player2 or m_winner = 0)
);

create table friendlist(
	user1		integer not null references users(id),
	user2		integer not null references users(id),
	primary key(user1, user2)
);

create or replace function addmatch(p1 int, p2 int, p1_s int, p2_s int)
	returns void
as $$
begin
	if p1_s > p2_s then 
		insert into matches (player1, p1_score, player2, p2_score, m_winner) values(p1, p1_s, p2, p2_s, p1);
	elsif p1_s < p2_s then 
		insert into matches (player1, p1_score, player2, p2_score, m_winner) values(p1, p1_s, p2, p2_s, p2);
	else
		insert into matches (player1, p1_score, player2, p2_score, m_winner) values(p1, p1_s, p2, p2_s, 0);
	end if;
end;
$$ language plpgsql ;

--  /* Test datas!
insert into users (username, rank, passwd) values
	('kuvarti', 1000, 'hashedpasswd'),
	('pro', 999, 'hashedpasswd'),
	('normal player', 500, 'hashedpasswd'),
	('noob', 10, 'hashedpasswd');

select addmatch(1, 2, 5, 3);
select addmatch(3, 4, 2, 1);

select addmatch(2, 3, 3, 5);
select addmatch(4, 1, 1, 2);

select addmatch(1, 3, 4, 4);
select addmatch(2, 4, 2, 2);

--!FAIL:	This hould not happen!
insert into friendlist (user1, user2) values
	(1, 2),
	(2, 1);

select * from users;
select * from matches;
select u1.username as player1, u2.username as player2, matches.m_winner
from matches, users as u1, users as u2
where matches.player1 = u1.id and matches.player2 = u2.id;
--*/