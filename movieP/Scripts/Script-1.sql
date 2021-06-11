
drop table memberinfo;

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
('aaaa11', '1111', '김현주', '1994-11-11','010-2075-4220', 'adsdfdf12@naver.com','일반', '2020-05-28'),
('bbbb22', '2222', '박현준','1996-10-22','010-9809-2527', 'asdfdgg235@naver.com','일반', '2020-04-18'),
('cccc33', '3333', '김인호' ,'1993-03-14','010-9006-9143', 'eedfdfdf36@daum.com','일반', '2020-03-22'),
('dddd44', '4444', '권종원','2000-09-04', '010-5651-7823', 'cbc34342@hanmail.net','일반','2019-03-20'),
('eeee55', '5555', '원영인' ,'1997-08-13','010-6692-6075', 'erwter378@naver.com','일반', '2020-06-01'),
('kkkk66', '6666', '정상욱' ,'1992-02-27','010-3479-3435', 'srfsw567@nate.com','일반', '2019-09-03'),
('qwer123', '5555', '박강남' ,'1997-01-01','010-5637-7824', 'hgdxxbhg4@naver.com','일반', '2019-12-01'),
('zxcv345', '5555', '장항해' ,'1997-07-02','010-2345-3435', 'erdjbz6@anmail.net','일반', '2020-05-11'),
('asdf542', '5555', '김건반' ,'1997-04-08','010-3342-5647', '5555@naver.com','일반', '2020-04-28'),
('tttt234', '5555', '홍포터' ,'1997-12-25','010-4574-4523', 'ggdaebx87@daum.com','일반', '2020-05-03'),
('movie123', '2222', '나다' ,'1997-11-11','010-4567-3457', 'bybesdf28@gmail.com','탈퇴', '2018-07-28');




create table personalqna (
	persindex int auto_increment primary key,
	perscate varchar(100),
	persid varchar(100),
	perstitle varchar(100),
	perscont varchar(3000),
	persimg varchar(100),
	persqtime datetime,
	persacont varchar(3000),
	persatime datetime,
	persstate varchar(100)
);