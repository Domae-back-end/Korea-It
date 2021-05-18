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

	 
	 
	 <!-- 매출 관련 게시판 ( 테스트용)  -->
	 CREATE TABLE salestest (
 	purchaseNo int auto_increment primary key,
	userid varchar(100),
	purchasePrice	int	,
	purchaseType	varchar(100)	,
	purchaseName	varchar(100)	,
	purchasetime	datetime	
);


create table review(
	cnt int auto_increment primary key,
	cate varchar(100),
	userid varchar(100),
	postcontent varchar(2000),
	posttime date
);	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 




/*박현준 - 공지사항테이블. 번호, 구분(시스템, 영화관, 기타), 제목, 내용, 등록일, 조회수*/
create table noticeboard (
	noticeindex int auto_increment primary key,
	noticecate varchar(100),
	noticetitle varchar(100),
	noticecont varchar(3000),
	noticetime datetime,
	noticeview int
);


/*박현준 - 1대1문의, 상담내역확인. 번호, 문의유형(일반문의, 영화정보, 회원, 예매, 분실물, 제안/건의), 아이디, 제목, 내용, 사진, 등록일, 답변시간, 답변상태*/
create table personalqna (
	persindex int auto_increment primary key,
	perscate varchar(100),
	persid varchar(100),
	perstitle varchar(100),
	perscont varchar(3000),
	persimg varchar(100),
	persqtime datetime,
	persatime datetime,
	persstate varchar(100)
);



/*박현준 - 자주묻는질문. 번호, 카테고리(전체, 영화/예매, 가입, 영화관, 기타), 제목, 내용*/
create table basicqna (
	bqindex int auto_increment primary key,
	bqcate varchar(100),
	bqtitle varchar(100),
	bqcont varchar(3000)
);



