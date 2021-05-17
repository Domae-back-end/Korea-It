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

create table movieimg(
	movietitle varchar(100) not null,
	imgname varchar(100)

);