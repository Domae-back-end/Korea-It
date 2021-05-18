<!-- 영화 정보 관리 관련 테이블  -->
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

drop table actor;
drop table cate;
drop table movieimg;

create table actor(
	actorid varchar(100) ,
	actorname varchar(100) ,
	m_index int,
	birthdata date
);


create table cate(
	m_index int,
	cate varchar(100)
);

create table movieimg(	
	m_index int,
	imgname varchar(100)

);



<!-- 영화 예매기능 관련 테이블  -->

create table movietime (
	m_index int auto_increment primary key,
	movietitle varchar(100),
	sectorNo varchar(100),
	starttime time,
	endtime time,
	reg_date date
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


