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


<!-- 회원관련 -->


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

<!-- 배너관련 -->
create table bannerimg(
	bannerindex int,
	imgurl varchar(1000)
);

<!-- 공지 게시판 테이블 -->
CREATE TABLE `noticeboard` (
	`noticeindex`	auto_increment,
	`noticeViews`	int	default 0,
	`noticeTitle`	varchar(100)  ,
	`noticeContent`	varchar(3000)	,
	`noticeTime`	datetime	,
	`noticeImg`	varchar(100)
	
);
INSERT INTO bannerimg (bannerindex,imgurl) VALUES
	 (1,'poster1.jpg'),
	 (2,'poster2.jpg'),
	 (3,'poster3.jpg'),
	 (4,'poster4.jpg'),
	 (5,'poster5.jpg');


