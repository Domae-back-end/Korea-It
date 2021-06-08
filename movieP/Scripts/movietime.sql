create table movietime (
	time_index int auto_increment primary key,
	movietitle varchar(100),
	sectorNo varchar(100),
	starttime time,
	endtime time,
	reg_date date
);

create table ticketing(
	t_index int auto_increment primary key,
	time_index int,
	people varchar(30),
	seatNo varchar(30),
	userid varchar(100),
	reg_date datetime
);

create table memberinfo(
   userid varchar(100),
   userpw varchar(100),
   username varchar(20),
   userbirth date,
   userpnum varchar(20), 
   useremail varchar(100),
   kind varchar(100),
   joinday date
);


insert into memberinfo (userid,userpw,username,userbirth,userpnum,useremail,kind,joinday) values
('aaaa11', '1111', '김현주', '1994-11-11','010-2075-4220', '1111@naver.com','일반', sysdate()),
('bbbb22', '2222', '박현준','1996-11-11','010-9809-2527', '2222@naver.com','일반', sysdate()),
('cccc33', '3333', '김인호' ,'1993-11-11','010-9006-9143', '3333@naver.com','일반', sysdate()),
('dddd44', '4444', '권종원','2000-11-11', '010-5651-7823', '4444@naver.com','일반', sysdate()),
('eeee55', '5555', '원영인' ,'1997-11-11','010-6692-6075', '5555@naver.com','일반', sysdate()),
('eeee55', '2222', '나다' ,'1997-11-11','010-2222-2222', '5555@gmail.com','탈퇴', sysdate());
ALTER TABLE ticketing ADD saleslink INT; <!-- 칼럼추가요. salestable 과 엮기 위함. -->

INSERT INTO unoestellar.ticketing (time_index,people,seatNo,userid,reg_date) VALUES
	 (9,NULL,'B4','dddd44','2021-05-31 11:56:40'),
	 (9,NULL,'C5','dddd44','2021-05-31 11:56:40'),
	 (1,NULL,'A1','dddd44','2021-05-31 12:56:40'),
	 (1,NULL,'A2','dddd44','2021-05-31 12:56:40'),
	 (1,NULL,'A3','dddd44','2021-05-31 12:56:40');
	 
	INSERT INTO unoestellar.movietime (movietitle,sectorNo,starttime,endtime,reg_date) VALUES
	 ('자산어보','작은관','06:32:22','08:38:22','2021-05-31'),
	 ('크루엘라','기존관','06:34:37','08:47:37','2021-05-31'),
	 ('분노의 질주-더 얼티메이트','기존관','06:34:58','08:56:58','2021-05-31'),
	 ('분노의 질주-더 얼티메이트','기존관','18:34:06','20:56:06','2021-05-31'),
	 ('비와 당신의 이야기','기존관','18:34:12','20:31:12','2021-05-31'),
	 ('비와 당신의 이야기','기존관','06:34:18','08:31:18','2021-05-31'),
	 ('비와 당신의 이야기','기존관','20:37:25','22:34:25','2021-05-31'),
	 ('분노의 질주-더 얼티메이트','기존관','13:40:34','16:02:34','2021-05-31'),
	 ('자산어보','기존관','13:41:52','15:47:52','2021-05-31'),
	 ('자산어보','기존관','16:46:03','18:52:03','2021-05-31');
	 
	

CREATE TABLE sales (
 sales_index int auto_increment primary key,
 timetableidx int,
 people varchar(30),
 sectorNo   varchar(100)   ,
 salesprice int,
 userid varchar(100),
 m_index int,
 movietitle   varchar(100), 
 sales_type   varchar(100),
 sales_time datetime
);