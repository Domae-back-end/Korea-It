create table movieinfo(
	m_index int auto_increment primary key,
	movietitle varchar(100),
	mdir	varchar(30),
	mactrs varchar(100),
	mcate varchar(20),
	mdate	date,
	mplot	varchar(1000),
	mplaytime	int,
	movieimg	varchar(100),
	star	int
);

create table movietime (
	m_index int auto_increment primary key,
	movietitle varchar(100),
	sectorNo varchar(100),
	starttime time,
	endttime time,
	reg_date date
);


create table actor(
	actorid varchar(100) ,
	actorname varchar(100) ,
	movietitle varchar(100) not null,
	birthdata date
);


create table cate(
	movietitle varchar(100) not null,
	cate varchar(100) not null
);

create table memberinfo(
   userid varchar(100) primary key,
   userpw varchar(100),
   username varchar(20),
   userbirth date,
   userpnum varchar(20), 
   useremail varchar(100),
   userpoint int,
   joinday date
);


