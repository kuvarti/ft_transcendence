drop database if exists transcendence;
drop user if exists client;

create database transcendence;
create user client with PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE transcendence TO client;
ALTER ROLE client CREATEDB;
USE transcendence;

drop table if exists matches;
drop table if exists friendlist;
drop table if exists users;
drop type if exists winner;
drop function if exists addmatch(p1 int, p2 int, p1_s int, p2_s int);

-- users
create table users(
	id			serial unique not null primary key,
	username	varchar(16) unique not null check(length(username) > 2),
	rank		integer not null check(rank >= 0 and rank <= 1000),
	passwd		varchar(72) not null-- bcrypt max hashed value length
	-- ....
);

-- played matches
create table matches(
	match_id	serial unique not null primary key,
	player1		integer not null references users(id),
	p1_score	integer not null,
	player2		integer not null references users(id),
	p2_score	integer not null,
	m_winner	integer check(m_winner = player1 or m_winner = player2 or m_winner = 0)
);

-- users friends lists
create table friendlist(
	user1		integer not null references users(id),
	user2		integer not null references users(id),
	primary key(user1, user2)
);

-- Adding Match Results
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
