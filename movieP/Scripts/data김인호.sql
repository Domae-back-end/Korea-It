<!-- 테이블 초기화작업 -->


drop table movieinfo;
drop table actor;
drop table cate;
drop table movieimg;
drop table basicqna;
drop table salestest;
drop table monthsales;
<!-- 버림 -->
drop table daysales;

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
	star	int,
	mlike int,
	viewcnt int
);


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
<!-- qna 테이블 가안-->

create table basicqna (
	bqindex int auto_increment primary key,
	bqcate varchar(100),
	bqtitle varchar(100),
	bqcont varchar(3000),
	faqurl1 varchar(100),
	faqurl2 varchar(100),
	viewcnt  int
);


<!-- sales     ver 2    t_index int 삭제!!   ticket_pcount int, 삭제 people varchar(100   -->

<!--3개씩 정리 SALES
매출/환불시마다 1씩증가 // 무비타임테이블에서의 고유번호 (한마디로 상품과 같음. )//
 관명칭  //        건당매출액(+값) or 건당환불액(-값)  //     유저아이디 
 영화정보테이블index //영화제목    //        카드냐 환불이냐      //      건수 등록된 시간 (datetime)

-->
CREATE TABLE sales (
 sales_index int auto_increment primary key,
 timetableidx int,
 people varchar(30),
 
  
 sectorNo	varchar(100)	,
 salesprice int,
 userid varchar(100),
 
 m_index int,
 movietitle	varchar(100), 
 sales_type	varchar(100),
 sales_time datetime
);
<!-- sales의 salestime 은  ticketing 의 reg_date 와 동일함.   -->
<!--  -->
<!-- 긴급수정 !!  sales 테이블  -->

alter table sales change moviesector sectorNo varchar(100);
alter table monthsales change sectorCode sectorNo varchar(100);
<!-- 긴급수정 ! 5월 31일 오후5시  윗부분 create  이미 수정함. -->
alter table sales change ticket_index t_index varchar(100);

<!-- 월정산 매출액 테이블(시간xxx년 xx월 1일 ,    ) -->
CREATE TABLE monthsales (
	monthdate DATE,
	sumall bigint,
	totalsale BIGINT,
	totalrefund bigint,
	sectorCode VARCHAR(100)	
	);

	
	
	
	






<!-- movieinfo inserrt -->
	
	
INSERT INTO movieinfo (movietitle,mdir,mactrs,mcate,mdate,mplot,mplaytime,movieimg,star,mlike,viewcnt) VALUES
	 ('소울','피트 닥터','제이미 폭스,티나 페이,다비드 딕스,필리샤 라샤드','애니메이션','2021-01-20','나는 어떻게 ‘나’로 태어나게 되었을까?
지구에 오기 전 영혼들이 머무는 ‘태어나기 전 세상’이 있다면?
뉴욕에서 음악 선생님으로 일하던 ‘조’는
 꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날,
 예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다.
 
 탄생 전 영혼들이 멘토와 함께 자신의 관심사를 발견하면 지구 통행증을 발급하는 ‘태어나기 전 세상’
 ‘조’는 그 곳에서 유일하게 지구에 가고 싶어하지 않는 시니컬한 영혼 ‘22’의 멘토가 된다.
 
 링컨, 간디, 테레사 수녀도 멘토되길 포기한 영혼 ‘22’
 꿈의 무대에 서려면 ‘22’의 지구 통행증이 필요한 ‘조’
 그는 다시 지구로 돌아가 꿈의 무대에 설 수 있을까?',107,'소울/poster.jpg',NULL,NULL,0),
	 ('귀멸의 칼날-무한열차편','소토자키 하루오','하나에 나츠키,키토 아카리','애니메이션','2021-01-27','혈귀로 변해버린 여동생 ‘네즈코’를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간 ‘탄지로.’
 ‘젠이츠’, ‘이노스케’와 새로운 임무 수행을 위해 무한열차에 탑승 후
 귀살대 최강 검사 염주 ‘렌고쿠’와 합류한다.
 
 달리는 무한열차에서 승객들이 하나 둘 흔적 없이 사라지자
 숨어있는 식인 혈귀의 존재를 직감하는 ‘렌고쿠’.
 
 귀살대 ‘탄지로’ 일행과 최강 검사 염주 ‘렌고쿠’는
 어둠 속을 달리는 무한열차에서 모두의 목숨을 구하기 위해
 예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을 시작하는데…',117,'귀멸의 칼날-무한열차편/poster.jpg',NULL,NULL,0),
	 ('빛과 철','배종대','엄혜란,김시은,박지후','드라마','2021-02-18','두 여자가 한 교통사고로 남편들을 잃었다. 
희주의 남편은 죽었고, 영남의 남편은 2년째 의식불명. 
2년 만에 고향에 돌아온 희주는 우연히 영남을 맞닥뜨리고, 
영남의 딸 은영은 희주의 주위를 의뭉스럽게 맴돈다. 

하나의 사건, 각자의 이유, 조각난 진실... 
빛과 빛, 철과 철이 부딪치던 그날 밤의 비밀이 밝혀진다',107,'빛과 철/poster.jpg',NULL,NULL,0),
	 ('최면','최재훈','이다윗,조현,김도훈','공포,스릴러','2021-03-24','지우고 싶은 기억이 있어요?
학교생활에 충실한 영문과 대학생 ‘도현’(이다윗).
 우연히 편입생 ‘진호’(김남우)를 통해 최면에 관심을 가지게 되고
 ‘최교수’(손병호)에 의해 최면 치료를 받게 된다.
 그러나 최면 체험 이후 그는 알 수 없는 기억의 환영을 보기 시작하고
 친구들도 하나 둘 이상한 환영에 시달리다 의문의 사건을 맞이한다.
 ‘최교수’는 왜 ‘도현’과 친구들에게 최면을 걸기 시작한 것일까...?
 
 기억의 빈틈, 진실은 그곳에 있다!',85,'최면/poster.jpg',NULL,NULL,0),
	 ('자산어보','이준익','설경구,변요한,이정은,민도희','드라마','2021-03-31','“이 양반은 대역 죄인이니 너무 잘해줄 생각들 말어”
 순조 1년, 신유박해로 세상의 끝 흑산도로 유배된 ‘정약전’.
 호기심 많은 ''정약전''은 그 곳에서 바다 생물에 매료되어 책을 쓰기로 한다.
 이에 바다를 훤히 알고 있는 청년 어부 ‘창대’에게 도움을 구하지만
 ‘창대’는 죄인을 도울 수 없다며 단칼에 거절한다.
 
 “내가 아는 지식과 너의 물고기 지식을 바꾸자"
 ‘창대’가 혼자 글 공부를 하며 어려움을 겪고 있다는 것을 알게 된 ‘정약전’은
 서로의 지식을 거래하자고 제안하고
 거래라는 말에 ‘창대’는 못 이기는 척 받아들인다.
 둘은 티격태격하면서도 점차 서로의 스승이자 벗이 되어 간다.
 
 "너 공부해서 출세하고 싶지?"
 그러던 중 ''창대''가 출세하기 위해 공부에 매진했다는 사실을 알게 된 ''정약전''은 크게 실망한다.
 ‘창대’ 역시 ''정약전''과는 길이 다르다는 것을 깨닫고
 ''정약전''의 곁을 떠나 세상 밖으로 나가고자 결심하는데...',126,'자산어보/poster.jpg',NULL,NULL,0),
	 ('유다 그리고 블랙 메시아','샤카 킹','다니엘 칼루야,키스 스탠필드,마틴 쉰,제시 플레먼스','드라마','2021-04-22','블랙의 메시아 그리고 블랙의 유다...
혁명가를 죽여도 혁명은 죽지 않는다
FBI 국장 J. 에드거 후버는 미국 내 반체제적인 정치 세력을 감시하고 와해시키는 대 파괴자 정보활동을 설립하고 급부상하는 흑인 민권 지도자들을 ‘블랙 메시아’로 규정해 무력화시킨다. 1968년 FBI는 흑표당 일리노이주 지부장으로서 투쟁을 이끄는 20살의 대학생 프레드 햄프턴을 국가 안보를 위협하는 대중 정치 선동가로 지목해 그를 감시하기 위한 정보원을 잠입시키기로 한다. 한편, FBI 요원을 사칭해 차를 절도하다 체포된 윌리엄 오닐은 FBI 요원 미첼에게 7년 간 감옥에서 썩을 것인지 아니면 흑표당에 잠입해 햄프턴을 감시할 것인지 제안 받는다. 조직에 들어간 오닐은 미첼 요원의 영향력에 강하게 끌리면서도, 흑표당이 정면으로 맞서 싸우는 사회적 불평등을 경험하면서 햄프턴의 메시지에도 동화되기 시작한다. 지부 보안 책임자의 자리까지 오르고 햄프턴과 가까워질수록 용기 있는 일과 자기 목숨 부지하는 일 사이의 기로에 놓이게 되는데…
 1969년 12월 4일, 운명적인 배신과 비극적인 선택의 그날이 다가오고 있었다!',125,'유다 그리고 블랙 메시아/poster.jpg',NULL,NULL,0),
	 ('비와 당신의 이야기','조진모','강하늘,천우희,이설,이양희','드라마,멜로/로맨스','2021-04-28','“이건 기다림에 관한 이야기다"
 뚜렷한 꿈도 목표도 없이 지루한 삼수 생활을 이어가던 ‘영호''(강하늘),
 오랫동안 간직해온 기억 속 친구를 떠올리고 무작정 편지를 보낸다.
 
 자신의 꿈은 찾지 못한 채 엄마와 함께 오래된 책방을 운영하는 ‘소희''(천우희)는
 언니 ‘소연’에게 도착한 ‘영호''의 편지를 받게 된다.
 
 “몇 가지 규칙만 지켜줬으면 좋겠어.
 질문하지 않기, 만나자고 하기 없기 그리고 찾아오지 않기.”
 
 ‘소희''는 아픈 언니를 대신해 답장을 보내고 두 사람은 편지를 이어나간다.
 우연히 시작된 편지는 무채색이던 두 사람의 일상을 설렘과 기다림으로 물들이기 시작하고,
 ‘영호''는 12월 31일 비가 오면 만나자는 가능성이 낮은 제안을 하게 되는데...',117,'비와 당신의 이야기/poster.jpg',NULL,NULL,0),
	 ('분노의 질주-더 얼티메이트','저스틴 린','빈 디젤,존 시나,성 강,샤를리즈 테론,미셸 로드리게즈,조다나 브류스터','액션','2021-05-19','기다림은 끝났다!
전 세계가 기다려온 단 하나의 액션블록버스터!
도미닉(빈 디젤)은 자신과 가장 가까웠던 형제 제이콥(존 시나)이 사이퍼(샤를리즈 테론)와 연합해
 전 세계를 위기로 빠트릴 위험천만한 계획을 세운다는 사실을 알게 되고,
 이를 막기 위해 다시 한 번 패밀리들을 소환한다.
 
 가장 가까운 자가 한순간, 가장 위험한 적이 된 상황
 도미닉과 패밀리들은 이에 반격할 놀라운 컴백과 작전을 세우고
 지상도, 상공도, 국경도 경계가 없는 불가능한 대결이 시작되는데…

제작노트 보기',142,'분노의 질주-더 얼티메이트/poster.jpg',NULL,NULL,0),
	 ('크루엘라','크레이그 질레스피','엠마 스톤,엠마 톰슨,마크 스트롱,에밀리 비샴,폴 월터 하우저','드라마,범죄,코미디','2021-05-26','처음부터 난 알았어. 내가 특별하단 걸
 그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는 없잖아?
 그러다 보니 결국, 학교를 계속 다닐 수가 없었지
 
 우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고
 나의 뛰어난 패션 감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이 했어
 
 도둑질이 지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어
 거리를 떠돌았지만 패션을 향한 나의 열정만큼은 언제나 진심이었거든
 
 근데 이게 뭐야, 옷에는 손도 못 대보고 하루 종일 바닥 청소라니
 인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작 부인이 나타났어
 천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지
 
 꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…
 
 그래서 난 내가 누군지 보여주기로 했어
 잘가, 에스텔라
 
 난 이제 크루엘라야!',133,'크루엘라/poster.jpg',NULL,NULL,0),
	 ('캐시트럭','가이 리치','제이슨 스타뎀,스콧 이스트우드,조휘 하트넷,포스트 말론,홀트 맥칼라니','액션','2021-06-09','캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).
 분노에 휩싸인 그는 아들을 죽인 범인의 단서를 찾기 위해
 현금 호송 회사에 위장 취업한다.
 
 첫 임무부터 백발백중 사격 실력을 자랑하며,
 단숨에 에이스로 급부상한 H.
 캐시트럭을 노리는 자들을 하나 둘 처리하며,
 아들을 죽인 범인들과 점점 가까워지는데…
 
 자비는 없다, 분노에 가득 찬 응징만이 남았다.
 
 그의 분노가 폭발한다!',119,'캐시트럭/poster.jpg',NULL,NULL,0);
 
 
 
 
INSERT INTO movieinfo (movietitle,mdir,mactrs,mcate,mdate,mplot,mplaytime,movieimg,star,mlike,viewcnt) VALUES
	 ('컨저링 3-악마가 시켰다','마이클 차베즈','베라 파미가,패트릭 윌슨,줄리안 힐리아드,로우리 오코너','공포,미스터리,스릴러','2021-06-13','모든 것은 악마가 시켰다!
1981년, 미국 역사상 최초로 잔혹한 살인사건의 용의자가 악마가 살해하도록 시켰다고 주장하는 초유의 사태가 일어난다! 그리고 사건의 배후에는 악마에게 빙의된 소년이 있었는데…
 초자연 현상 연구가 워렌 부부의 사건 파일 중 여전히 미스터리로 남아있는 실화!
 진실 혹은 거짓? 살인사건의 범인, 인간인가 악마인가...',111,'컨저링 3-악마가 시켰다/poster.jpg',NULL,NULL,0);






 
 
 
 <!-- cate   -->
 
 INSERT INTO cate (m_index,cate) VALUES
	 (1,'애니메이션'),
	 (2,'애니메이션'),
	 (3,'드라마'),
	 (4,'공포'),
	 (4,'스릴러'),
	 (5,'드라마'),
	 (6,'드라마'),
	 (7,'드라마'),
	 (7,'멜로/로맨스'),
	 (8,'액션');
INSERT INTO cate (m_index,cate) VALUES
	 (9,'드라마'),
	 (9,'범죄'),
	 (9,'코미디'),
	 (10,'액션'),
	 (11,'공포'),
	 (11,'미스터리'),
	 (11,'스릴러');
 
 
<!--  actor  -->

INSERT INTO actor (actorid,actorname,m_index,birthdata) VALUES
	 (NULL,'제이미 폭스',1,NULL),
	 (NULL,'티나 페이',1,NULL),
	 (NULL,'다비드 딕스',1,NULL),
	 (NULL,'필리샤 라샤드',1,NULL),
	 (NULL,'하나에 나츠키',2,NULL),
	 (NULL,'키토 아카리',2,NULL),
	 (NULL,'시모노 히로',2,NULL),
	 (NULL,'마츠오카 요시즈쿠',2,NULL),
	 (NULL,'히노 사토시',2,NULL),
	 (NULL,'엄혜란',3,NULL);
	 
	 
INSERT INTO actor (actorid,actorname,m_index,birthdata) VALUES
	 (NULL,'김시은',3,NULL),
	 (NULL,'박지후',3,NULL),
	 (NULL,'이다윗',4,NULL),
	 (NULL,'조현',4,NULL),
	 (NULL,'김도훈',4,NULL),
	 (NULL,'설경구',5,NULL),
	 (NULL,'변요한',5,NULL),
	 (NULL,'이정은',5,NULL),
	 (NULL,'민도희',5,NULL),
	 (NULL,'다니엘 칼루야',6,NULL);
	 
	 
INSERT INTO actor (actorid,actorname,m_index,birthdata) VALUES
	 (NULL,'키스 스탠필드',6,NULL),
	 (NULL,'마틴 쉰',6,NULL),
	 (NULL,'제시 플레먼스',6,NULL),
	 (NULL,'강하늘',7,NULL),
	 (NULL,'천우희',7,NULL),
	 (NULL,'이설',7,NULL),
	 (NULL,'이양희',7,NULL),
	 (NULL,'빈 디젤',8,NULL),
	 (NULL,'존 시나',8,NULL),
	 (NULL,'성 강',8,NULL);
	 
	 
INSERT INTO actor (actorid,actorname,m_index,birthdata) VALUES
	 (NULL,'샤를리즈 테론',8,NULL),
	 (NULL,'미셸 로드리게즈',8,NULL),
	 (NULL,'조다나 브류스터',8,NULL),
	 (NULL,'엠마 스톤',9,NULL),
	 (NULL,'엠마 톰슨',9,NULL),
	 (NULL,'마크 스트롱',9,NULL),
	 (NULL,'에밀리 비샴',9,NULL),
	 (NULL,'폴 월터 하우저',9,NULL),
	 (NULL,'제이슨 스타뎀',10,NULL),
	 (NULL,'스콧 이스트우드',10,NULL);
	 
	 
INSERT INTO actor (actorid,actorname,m_index,birthdata) VALUES
	 (NULL,'조휘 하트넷',10,NULL),
	 (NULL,'포스트 말론',10,NULL),
	 (NULL,'홀트 맥칼라니',10,NULL),
	 (NULL,'베라 파미가',11,NULL),
	 (NULL,'패트릭 윌슨',11,NULL),
	 (NULL,'줄리안 힐리아드',11,NULL),
	 (NULL,'로우리 오코너',11,NULL);

	 
	 
	 <!-- movie img 테이블 -->
	 
	 INSERT INTO movieimg (m_index,imgname) VALUES
	 (1,'소울/poster.jpg'),
	 (1,'소울/still1.jpg'),
	 (1,'소울/still2.jpg'),
	 (1,'소울/still3.jpg'),
	 (1,'소울/still4.jpg'),
	 (1,'소울/still5.jpg'),
	 (2,'귀멸의 칼날-무한열차편/poster.jpg'),
	 (2,'귀멸의 칼날-무한열차편/still1.jpg'),
	 (2,'귀멸의 칼날-무한열차편/still1.jpg'),
	 (2,'귀멸의 칼날-무한열차편/still1.jpg');
INSERT INTO movieimg (m_index,imgname) VALUES
	 (2,'귀멸의 칼날-무한열차편/still1.jpg'),
	 (2,'귀멸의 칼날-무한열차편/still1.jpg'),
	 (3,'빛과 철/poster.jpg'),
	 (3,'빛과 철/still1.jpg'),
	 (3,'빛과 철/still2.jpg'),
	 (3,'빛과 철/still3.jpg'),
	 (3,'빛과 철/still4.jpg'),
	 (4,'최면/poster.jpg'),
	 (4,'최면/still1.jpg'),
	 (4,'최면/still2.jpg');
INSERT INTO movieimg (m_index,imgname) VALUES
	 (4,'최면/still3.jpg'),
	 (4,'최면/still4.jpg'),
	 (4,'최면/still5.jpg'),
	 (5,'자산어보/poster.jpg'),
	 (5,'자산어보/still1.jpg'),
	 (5,'자산어보/still2.jpg'),
	 (5,'자산어보/still3.jpg'),
	 (5,'자산어보/still4.jpg'),
	 (5,'자산어보/still5.jpg'),
	 (5,'자산어보/still6.jpg');
INSERT INTO movieimg (m_index,imgname) VALUES
	 (6,'유다 그리고 블랙 메시아/poster.jpg'),
	 (6,'유다 그리고 블랙 메시아/still1.jpg'),
	 (6,'유다 그리고 블랙 메시아/still2.jpg'),
	 (6,'유다 그리고 블랙 메시아/still3.jpg'),
	 (6,'유다 그리고 블랙 메시아/still4.jpg'),
	 (6,'유다 그리고 블랙 메시아/still5.jpg'),
	 (6,'유다 그리고 블랙 메시아/still6.jpg'),
	 (6,'유다 그리고 블랙 메시아/still7.jpg'),
	 (6,'유다 그리고 블랙 메시아/still8.jpg'),
	 (7,'비와 당신의 이야기/poster.jpg'),
	 (7,'비와 당신의 이야기/still1.jpg'),
	 (7,'비와 당신의 이야기/still2.jpg'),
	 (7,'비와 당신의 이야기/still3.jpg'),
	 (7,'비와 당신의 이야기/still4.jpg'),
	 (7,'비와 당신의 이야기/still5.jpg'),
	 (7,'비와 당신의 이야기/still6.jpg'),
	 (8,'분노의 질주-더 얼티메이트/poster.jpg'),
	 (8,'분노의 질주-더 얼티메이트/still1.jpg'),
	 (8,'분노의 질주-더 얼티메이트/still2.jpg'),
	 (8,'분노의 질주-더 얼티메이트/still3.jpg'),	 
	 (8,'분노의 질주-더 얼티메이트/still4.jpg'),
	 (8,'분노의 질주-더 얼티메이트/still5.jpg'),
	 (8,'분노의 질주-더 얼티메이트/still6.jpg'),
	 (9,'크루엘라/poster.jpg'),
	 (9,'크루엘라/still1.jpg'),
	 (9,'크루엘라/still2.jpg'),
	 (9,'크루엘라/still3.jpg'),
	 (9,'크루엘라/still4.jpg'),
	 (10,'캐시트럭/poster.jpg'),
	 (10,'캐시트럭/still1.jpg'),
	 (10,'캐시트럭/still2.jpg'),
	 (10,'캐시트럭/still3.jpg'),
	 (10,'캐시트럭/still4.jpg'),
	 (10,'캐시트럭/still5.jpg'),
	 (10,'캐시트럭/still6.jpg'),
	 (10,'캐시트럭/still7.jpg'),
	 (11,'컨저링 3-악마가 시켰다/poster.jpg'),
	 (11,'컨저링 3-악마가 시켰다/still1.jpg');
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 <!-- sales    테이블 들어갈 내용들   -->
	 
	 <!--  -->
	 
<!--매출  데이터 준비 중. ..   -->	 

<!-- 예시!! -->
INSERT INTO sales (timetableidx, people, salesprice ,userid,  m_index,movietitle, ,sectorNo, sales_type,sales_time) VALUES	 
(1, CCAA, 40000, dddd44, 자산어보, 기존관1, 카드,  2021-05-21 10:11:11  );
	 
<!-- 일단 관 종류 확정이 나야 함..   -->

	 
