
<!-- 초기화하기  -->
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
('aaaa11', '1111', '김현주', '1994-11-11','010-2075-4220', '1111@naver.com','일반', sysdate()),
('bbbb22', '2222', '박현준','1996-11-11','010-9809-2527', '2222@naver.com','일반', sysdate()),
('cccc33', '3333', '김인호' ,'1993-11-11','010-9006-9143', '3333@naver.com','일반', sysdate()),
('dddd44', '4444', '권종원','2000-11-11', '010-5651-7823', '4444@naver.com','일반', sysdate()),
('eeee55', '5555', '원영인' ,'1997-11-11','010-6692-6075', '5555@naver.com','일반', sysdate()),
('eeee55', '2222', '나다' ,'1997-11-11','010-2222-2222', '5555@gmail.com','탈퇴', sysdate());
