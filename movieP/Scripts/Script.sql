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
<!-- 좋아요 갯수 칼럼추가 -->
alter table movieinfo add mlike int;



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

create table ticketing(
	m_index int auto_increment primary key,
	time_index int,
	seatNo varchar(30),
	userid varchar(100)
);
<!-- movietimetable > testdata -->

insert into movietime (movietitle, sectorNo, starttime, endtime, reg_date)
values ('테스트제목','4','12:00:00', '14:00:00', '2021-05-25');




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
 sales_index int auto_increment primary key,
 ticket_index int,
 ticket_pcount int,
 salesprice int,
 userid varchar(100),
 movietitle	varchar(100)	,
 m_index int,
 moviesector	varchar(100)	,
 sales_type	varchar(100),
 sales_time datetime
);
/* 표 시간은 > 예매정보테이블에서 ,티켓고유번호로 가져오기. sales_time 은 즉 결제시간 또는 환불시간을 의미  */


/* 매출 테이블  testdata*/
insert into salestest (ticket_index, ticket_pcount,salesprice , userid,movietitle ,
moviesector, sales_type,sales_time)
values (1, 4,40000, 'bb1111','오늘의기억','작은1관','현금','2021-05-22 12:00:00'),
 (1, 4,-40000, 'bb1111','오늘의기억','작은1관','환불','2021-05-23 14:00:00') ;

<!-- 테스트용데이터 -->
insert into salestest (ticket_index, ticket_pcount,salesprice , userid,movietitle ,
moviesector, sales_type,sales_time)
values (1, 4,40000, 'bb1111','오늘의기억','작은1관','현금','2021-05-22 12:00:00'),
 (1, 4,-40000, 'bb1111','오늘의기억','작은1관','환불','2021-05-23 14:00:00'),
 (2, 4,40000, 'bb1111','오늘의기억','작은1관','현금','2021-05-22 12:00:00'),
(3, 4,40000, 'bb1111','오늘의기억','작은1관','현금','2021-05-22 12:00:00'), 
(4, 4,70000, 'bb1111','오늘의기억','작은1관','현금','2021-06-22 12:00:00'),
(3, 4,-40000, 'bb1111','오늘의기억','작은1관','환불','2021-05-22 12:00:00'), 
(5, 4,30000, 'bb1111','오늘의기억','작은1관','현금','2021-06-22 12:00:00'),
(6, 14,140000, 'bb1111','오늘의기억','작은1관','카드','2021-06-23 12:00:00') ;
<!--결제날짜 환불날짜 분리 안필요함.;;  -->

alter table salestest drop m_index;
alter table salestest add m_index int; 


<!-- 리뷰테이블  -->
create table review(
	cnt int auto_increment primary key,
	cate varchar(100),
	userid varchar(100),
	postcontent varchar(2000),
	posttime date,
	gpa int
);	 
	 
<!-- 유저 좋아요 테이블-->
create table userlikes(
g_index int auto_increment primary key,
userid varchar(200),
m_index int
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
	bqcont varchar(3000),
	faqurl1 varchar(100) default '',
	faqurl2 varchar(100) default ''
);
drop table basicqna;
<!--자찾질 테스트용  -->
insert into basicqna (bqcate, bqtitle, bqcont, faqurl1, faqurl2) 
values('영화/예매가입영화관기타','테스트1','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트제목2','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트3','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트제목4','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트5','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트6','테스트글2','/user/main','/user/main'),
('영화/예매가입영화관기타','테스트제목7','테스트글2','/user/main','/user/main');

<!-- 월정산 매출액 테이블(시간xxx년 xx월 1일 ,    ) -->
CREATE TABLE monthsales (
	monthdate DATE,
	sumall bigint,
	totalsale BIGINT,
	totalrefund bigint,
	sectorCode VARCHAR(100)	
	);


