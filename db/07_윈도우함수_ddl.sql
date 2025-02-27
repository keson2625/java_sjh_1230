drop database if exists window_func;

create database window_func;

use window_func;

create table team_score(
	ts_team char(1) primary key,
    ts_score int not null default 0
);
# a : 10, b : 5, c : 10, d : 10, f : 9, g : 8
insert into team_score values("a", 10),("b", 5),("c", 10),("e", 10),("f", 9),("g", 8)