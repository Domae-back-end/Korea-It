


<!--좋아요 테이블 -->
<!--내용은 없어도 무관함. 테스트 하실 분만 값 넣어서 사용하세요 -->
drop table userlikes;

create table userlikes(
	g_index int auto_increment primary key, 
	userid varchar(200),
	m_index int
);

insert into userlikes (userid, m_index) values 
('aaaa11', 27),
('aaaa11', 1),
('aaaa11', 2),
('aaaa11', 3),
('aaaa11', 4),
('bbbb22', 3),
('bbbb22', 4),
('bbbb22', 4),
('bbbb22', 1),
('bbbb22', 5),
('bbbb22', 26),
('bbbb22', 27),
('bbbb22', 19),
('bbbb22', 20),
('bbbb22', 13),
('cccc33', 1),
('cccc33', 2),
('cccc33', 3),
('cccc33', 4),
('cccc33', 5),
('cccc33', 10),
('cccc33', 20),
('dddd44', 12),
('dddd44', 2),
('dddd44', 17),
('dddd44', 18),
('dddd44', 19),
('eeee55', 20);
drop table review;

<!--리뷰테이블
cnt: primary key
cate: 영화 고유 코드
userid: 아이디
postcontent: 관람평 내용
posttime: 관람평 써진 시간
gpa: 평점
-->

create table review(
	cnt int auto_increment primary key,
	cate varchar(100),
	userid varchar(100),
	postcontent varchar(2000),
	posttime datetime,
	gpa int
);

<!--리뷰 테이블 내용은 없어도 무관함. 테스트 필요한 분들만 사용해도 됨.-->
insert into review (cate, userid, postcontent, posttime, gpa) values 
(8, 'aaaa11', '터넷 관람평1', '2020-08-20 11:00:12', 3),
(8, 'bbbb22', '터넷 관람평2', '2020-08-20', 2),
(8, 'cccc33', '터넷 관람평3', '2020-08-20', 4),
(8, 'dddd44', '터넷 관람평4', '2020-08-20', 1),
(8, 'eeee55', '터넷 관람평5', '2020-08-20', 4),
(27, 'aaaa11', '크루엘라 관람평1', '2021-05-29 11:22:11',1),
(27, 'bbbb22', '크루엘라 관람평2', '2021-06-01 12:11:21',1),
(27, 'dddd44', '크루엘라 관람평3', '2021-05-27 12:12:05',3),
(27, 'eeee55', '크루엘라 관람평4', '2021-06-02 15:33:44',2),
(26, 'eeee55', '분노의질주 관람평1', '2021-05-20 15:33:44',5),
(26, 'dddd44', '분노의질주 관람평2', '2021-05-28 15:23:44',5),
(26, 'cccc33', '분노의질주 관람평3', '2021-05-26 13:43:44', 3),
(25, 'bbbb22', '비와 당신의 이야기 관람평1', '2021-04-28 12:11:11',2),
(25, 'aaaa11', '비와 당신의 이야기 관람평2', '2021-04-30 12:11:11', 4),
(25, 'eeee55', '비와 당신의 이야기 관람평3', '2021-05-05 18:17:12', 4);