create database olympics_2021;
use olympics_2021;

select * from athlets;

create table games(game_id int primary key,game_name varchar(50));

create table athlets(ath_id int primary key,ath_name varchar(30),ath_dob date,ath_country varchar(15),
ath_remark varchar(15),
game_id int,ath_gender varchar(15),ath_height int,constraint gfk foreign key(game_id) references games(game_id));

create table medal(medal_id int primary key,medal_des varchar(15));

create table events(event_id int,ath_id int,venue varchar(50),eve_date date,
constraint afk foreign key(ath_id) references athlets(ath_id));
alter table events add medal_id int;
alter table events add constraint fkg foreign key(medal_id)references medal(medal_id);
alter table athlets drop  medal;
desc athlets;
desc games;
desc events;
alter table athlets drop column  medal_des;
alter table athlets add medal_des varchar(10);
update athlets set medal_des='gold' where medal_id=1;
update athlets set medal_des='silver' where medal_id=2;
update athlets set medal_des='bronze' where medal_id=3;
insert into games values(1001,'badminton'),(1002,'cycling'),(1003,'tabletennis'),(1004,'javlinthrowdistance'),
(1005,'swimming');
select * from games;
select * from events;
select * from athlets;
update athlets set ath_country='russia' where ath_id=114;

insert into athlets values(101,'neeraj chopra','1997-12-24','india','good athlet',1004,'male',177);
insert into athlets values(102,'chen yufei','1995-03-01','china','bestplayer',1001,'male',163);
insert into athlets values(103,'richard carapaz','1993-05-29','ecuador','good player',1002,'male',152);
insert into athlets values(104,'chenmeng','1993-08-30','china','bestplayer',1003,'male',155);
insert into ahlets values(105,'evgeny rylov','1996-09-23','russia','bestswimmer',1005,'male',177);
insert into athlets values(106,'sindhu','1995-07-05','india','bestplayer',1001,'female',176);
insert into athlets values(107,'taitzu ying','1994-06-24','china','best player',1001,'female',163);
insert into athlets values(108,'woutvan aert','1994-08-25','belgium','good player',1002,'male',190);
insert into athlets values(109,'tadej pogacar','1998-08-21','solvenia','best player',1002,'male',176);
insert into athlets values(110,'sunyingsha','2000-11-04','china','good player',1003,'female',165);
insert into athlets values(111,'istomina','1993-06-23','japan','best player',1003,'female',160);
insert into athlets values(112,'jakub vadlejch','1990-10-10','czech','good player',1004,'male',190);
insert into athlets values(113,'vitezslavvesely','1983-02-27','czech','goodplayer',1004,'male',186);
insert into athlets values(114,'klimentkolesnikov','2000-07-09','russian','best player',1005,'male',196);
insert into athlets values(115,'ryanmurplg','1995-07-02','usa','best player',1005,'male',191);
select * from athlets;
select * from games;
select * from events ;
select * from medal;
alter table athlets add medal_id int;
alter table athlets add constraint mfk foreign key(medal_id) references medal(medal_id);
update athlets set  medal_id=1 where ath_id=101;
update athlets set  medal_id=1 where ath_id=102;
update athlets set  medal_id=1 where ath_id=103;
update athlets set  medal_id=1 where ath_id=104;
update athlets set  medal_id=1 where ath_id=105;
update athlets set  medal_id=3 where ath_id=106;
update athlets set  medal_id=2 where ath_id=107;
update athlets set  medal_id=2 where ath_id=108;
update athlets set  medal_id=3 where ath_id=109;
update athlets set  medal_id=2 where ath_id=110;
update athlets set  medal_id=3 where ath_id=111;
update athlets set  medal_id=2 where ath_id=112;
update athlets set  medal_id=3 where ath_id=113;
update athlets set  medal_id=2 where ath_id=114;
update athlets set  medal_id=3 where ath_id=115;
update athlets set ath_country='russia' where ath_id=114;
select * from athlets;


select ath_country ,count(medal_id) from athlets group by ath_country order by count(medal_id) desc limit 1  ;
select ath_country,medl_des,medal_id, group by ath_country order by medal_id desc as country from athlets;
select ath_country,medal_des,count(medal_id) from athlets group by ath_country having count(medal_id) ;
select game_name,count(game_id) from games group by game_name ;
select ath_country,count(ath_country) from athlets group by ath_country order by count(ath_country)desc limit 2;
select ath_country,group_concat(medal_des) as 'medal' from athlets group by ath_country; 
select ath_country,group_concat(medal_des) as 'medal' from athlets group by ath_country having medal='silver,bronze'; 
select ath_country,group_concat(medal_des) as 'medal' from athlets group by ath_country having medal='gold,silver'; 
select ath_country,group_concat(medal_des) as 'medal' from athlets group by ath_country having medal='silver'; 

SELECT a.ath_name, a.ath_id, a.ath_country, game_name FROm athlets a inner join games b WHERe a.game_id = b.game_id; 
select event_id,venue,eve_date,medal_des from events eve inner join medal med on eve.medal_id=med.medal_id;
select a.ath_name,a.ath_id,a.ath_country,e.venue,e.eve_date,a.game_id from athlets a inner join events e where a.ath_id=e.ath_id ;



select* from athlets where ath_remark in ('good athlet');
insert into medal values(01,'Gold'),(02,'Silver'),(03,'Bronze');
select * from athlets where ath_country='india' or ath_id=111;
select  min(ath_country) from athlets order by (min(ath_country));
select ath_country from athlets group by ath_country order by ath_country;
drop table events;
desc events;
select * from medal;
insert into events values(1,101,'japan national stadium','2021-08-04',01);
insert into events values(2,102,'musashino forest sport plaza','2021-07-24',01);
insert into events values(3,103,'musashinonomori park','2021-07-16',01);
insert into events values(4,104,'tokyo metropolitan gymnasium','2021-07-24',01);
insert into events values(5,105,'odaiba marine park','2021-07-24',01);
insert into events values(6,112,'japan national stadium','2021-08-04',02);
insert into events values(7,106,'musashino forest sport plaza','2021-07-24',03);
insert into events values(8,108,'musashinonomori park','2021-07-16',02);
insert into events values(9,110,'tokyo metropolitan gymnasium','2021-07-24',02);
insert into events values(10,114,'odaiba marine park','2021-07-24',02);
insert into events values(11,113,'japan national stadium','2021-08-04',03);
insert into events values(12,107,'musashino forest sport plaza','2021-07-24',02);
insert into events values(13,109,'musashinonomori park','2021-07-16',03);
insert into events values(14,111,'tokyo metropolitan gymnasium','2021-07-24',03);
insert into events values(15,115,'odaiba marine park','2021-07-24',03);
alter table events drop game_id;
alter table events add game_id int;
alter table events add constraint hjk foreign key (game_id) references games(game_id);
 

update events set game_id=1001 where event_id=1;
update events set game_id=1002 where event_id=2;
update events set game_id=1003 where event_id=3;
update events set game_id=1004 where event_id=4;
update events set game_id=1005 where event_id=5;
update events set game_id=1001 where event_id=6;
update events set game_id=1002 where event_id=7;
update events set game_id=1003 where event_id=8;
update events set game_id=1004 where event_id=9;
update events set game_id=1005 where event_id=10;
update events set game_id=1001 where event_id=11;
update events set game_id=1002 where event_id=12;
update events set game_id=1003 where event_id=13;
update events set game_id=1004 where event_id=14;
update events set game_id=1005 where event_id=15;
select * from events;
desc games;
select * from games;
select * from athlets;
select * from medal;
#/data retrival/#
select * from olympic;
use olympics_2021;

select ath_id,ath_name,ath_country from athlets where ath_id=101;
select * from athlets where ath_id>114;
select * from athlets where ath_id>=114;
select * from athlets where ath_id<113;
select * from athlets where ath_id<=113;
select * from athlets where ath_id in(101,102,103);
select * from athlets where ath_name like('k%');
select * from athlets where ath_name like('n%');
select * from athlets where ath_id is null;
select * from athlets where ath_id is not null;
select distinct ath_id from athlets;
select * from athlets where ath_id between 101 and 112;
select max(ath_id) from athlets;
select min(ath_id) from athlets;
select avg(ath_id) from athlets;
select sum(ath_id)from athlets;
select * from athlets order by ath_name,ath_id;
select* from athlets order by ath_gender;
select max(ath_country) country from athlets;

#test data retrival#
select reverse (ath_name) from athlets;

select * from athlets where ath_name like'k%';

select concat(upper(substr(ath_name,1,4)),lower(substr(ath_name,5)))as uppername from athlets;

select ath_country,game_id,ath_id from athlets where ath_id in(101,102);

select * from athlets order by ath_country;

select * from athlets order by game_id;

select ath_country, count(ath_country) country from athlets group by(ath_country);

select min(ath_country) from athlets;


select datediff('2021-08-05','2021-07-24') as datedif from events;

select ath_name,game_id from athlets;

select max(length(ath_name))from athlets;

select lower(left(ath_name,5))from athlets;

select ath_name,ath_country from athlets
order by(ath_country);

select ath_id,ath_name,  game_id from athlets where game_id in (1001,1004);

select ath_name,ath_id,medal from athlets where medal='gold' order by ath_id;

select ath_name,ath_id,medal from athlets where medal='silver'order by ath_id;

select ath_name,ath_id,medal from athlets where medal='bronze' order by ath_id;

select ath_country,count(game_id)  from athlets group by ath_country order by ath_country;

select ath_country,count(ath_id) from athlets group by ath_country order by ath_country ;

select ath_country,count(game_id)from athlets group by ath_country having count(game_id)>1;

#view . a view is virtual table that is based on the result of sql query.It is used to simplified complex queries 

create or replace view olympic_2021 as
select a.ath_id,a.ath_name,a.ath_country,g.game_id,g.game_name,e.event_id,e.venue,m.medal_des 
from 
games g inner join athlets a inner join events e inner join medal m 
on 
g.game_id=a.game_id and a.ath_id=e.ath_id and e.medal_id=m.medal_id; 

select * from olympic_2021 ;
select * from athlets;
alter table athlets drop column medal_desc;
#project questions#
select * from games;
select * from athlets;
#1# 
select count(game_name) from games;
#2#
select * from events;
#3#
select ath_country,game_id,count(game_id) from athlets group by ath_country,game_id ;
#4#
select count(game_name);
#5#
select ath_name,ath_country,game_id,medal_des from athlets where medal_des='gold';
#6#
use olymbics_2021;
select ath_country ,group_concat(medal_id) from athlets group by ath_country;
select a.ath_country,m.medal_des,a.ath_id from athlets a inner join medal m on a.medal_id=m.medal_id where medal_des="gold";
select a.ath_country,m.medal_des from athlets a inner join medal m on a.medal_id=m.medal_id where medal_des="silver";
select a.ath_name,a.ath_country ,g.game_name from athlets a inner join games g on a.game_id=g.game_id where g.game_name="swimming";
 select * from athlets where ath_country="india";
 select  count(*) from athlets where ath_country="india";
select  count(*) from athlets where ath_country in("india",'usa');
select ath_country,count(*) from athlets group by ath_country;
select ath_country,count(*) from athlets group by ath_country having count(*)>1;
select ath_id,event_id,medal_id,eve_date,rank() over(partition by event_id order by eve_date) from events;
select ath_id,ath_name,ath_country,game_id,rank() over(partition by game_id order by ath_id)from athlets;
 