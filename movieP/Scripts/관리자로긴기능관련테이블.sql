<!-- 관리자 로그인 기능  -->

<!--관리자 계정들 담긴 테이블  -->
create table adminaccount
(
adminindex int auto_increment primary key,
	adminid varchar(100),
	adminpw varchar(100),
	adminnick varchar(100),
	adminjoinday date
);

<!--자료추가  -->
INSERT INTO adminaccount (adminid,adminpw,adminnick,adminjoinday) VALUES
	 ('adad','adad','adad','2021-06-02');
	 
alter table adminaccount change daminnickname adminnick varchar(100);
