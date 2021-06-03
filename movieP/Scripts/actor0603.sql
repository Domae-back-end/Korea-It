-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.17-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 unoestellar.actor 구조 내보내기
drop table actor;

CREATE TABLE IF NOT EXISTS `actor` (
  `actorid` varchar(100) DEFAULT NULL,
  `actorname` varchar(100) DEFAULT NULL,
  `m_index` int(11) DEFAULT NULL,
  `birthdata` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 unoestellar.actor:~104 rows (대략적) 내보내기
DELETE FROM `actor`;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` (`actorid`, `actorname`, `m_index`, `birthdata`) VALUES
	(NULL, '신혜선', 1, NULL),
	(NULL, '배종옥', 1, NULL),
	(NULL, '허준호', 1, NULL),
	(NULL, '톰 홀랜드', 2, NULL),
	(NULL, '크리스 프랫', 2, NULL),
	(NULL, '줄리아 루이스', 2, NULL),
	(NULL, '유아인', 3, NULL),
	(NULL, '박신혜', 3, NULL),
	(NULL, '전배수', 3, NULL),
	(NULL, '이현욱', 3, NULL),
	(NULL, '이봉근', 4, NULL),
	(NULL, '이유리', 4, NULL),
	(NULL, '김하연', 4, NULL),
	(NULL, '모아 감멜', 5, NULL),
	(NULL, '메들린 마틴', 5, NULL),
	(NULL, '강동원', 6, NULL),
	(NULL, '이정현', 6, NULL),
	(NULL, '이레', 6, NULL),
	(NULL, '권해효', 6, NULL),
	(NULL, '존 크래신스키', 7, NULL),
	(NULL, '에밀리 블런트', 7, NULL),
	(NULL, '대니 드비토', 7, NULL),
	(NULL, '이안 맥켈런', 7, NULL),
	(NULL, '존 데이비드 워싱턴', 8, NULL),
	(NULL, '로버트 패틴슨', 8, NULL),
	(NULL, '엘리자베스 데비키', 8, NULL),
	(NULL, '제시카 차스테인', 9, NULL),
	(NULL, '콜린 파렐', 9, NULL),
	(NULL, '존 말코비치', 9, NULL),
	(NULL, '유역비', 10, NULL),
	(NULL, '이연걸', 10, NULL),
	(NULL, '공리', 10, NULL),
	(NULL, '견자단', 10, NULL),
	(NULL, '김대명', 11, NULL),
	(NULL, '송윤아', 11, NULL),
	(NULL, '김의성', 11, NULL),
	(NULL, '고아성', 12, NULL),
	(NULL, '이솜', 12, NULL),
	(NULL, '박혜수', 12, NULL),
	(NULL, '조현철', 12, NULL),
	(NULL, '이제훈', 13, NULL),
	(NULL, '조우진', 13, NULL),
	(NULL, '신혜선', 13, NULL),
	(NULL, '김혜수', 14, NULL),
	(NULL, '이정은', 14, NULL),
	(NULL, '노정의', 14, NULL),
	(NULL, '로자먼드 파이크', 15, NULL),
	(NULL, '샘 라일리', 15, NULL),
	(NULL, '아뉴린 바나드', 15, NULL),
	(NULL, '한지민', 16, NULL),
	(NULL, '남주혁', 16, NULL),
	(NULL, '갤 가돗', 17, NULL),
	(NULL, '크리스 파인', 17, NULL),
	(NULL, '크리스틴 위그', 17, NULL),
	(NULL, '페드로 파스칼', 17, NULL),
	(NULL, '수잔 서렌든', 18, NULL),
	(NULL, '케이스 윈슬렛', 18, NULL),
	(NULL, '제이미 폭스', 19, NULL),
	(NULL, '티나 페이', 19, NULL),
	(NULL, '다비드 딕스', 19, NULL),
	(NULL, '필리샤 라샤드', 19, NULL),
	(NULL, '하나에 나츠키', 20, NULL),
	(NULL, '키토 아카리', 20, NULL),
	(NULL, '시모노 히로', 20, NULL),
	(NULL, '마츠오카 요시즈쿠', 20, NULL),
	(NULL, '히노 사토시', 20, NULL),
	(NULL, '엄혜란', 21, NULL),
	(NULL, '김시은', 21, NULL),
	(NULL, '박지후', 21, NULL),
	(NULL, '이다윗', 22, NULL),
	(NULL, '조현', 22, NULL),
	(NULL, '김도훈', 22, NULL),
	(NULL, '설경구', 23, NULL),
	(NULL, '변요한', 23, NULL),
	(NULL, '이정은', 23, NULL),
	(NULL, '민도희', 23, NULL),
	(NULL, '다니엘 칼루야', 24, NULL),
	(NULL, '키스 스탠필드', 24, NULL),
	(NULL, '마틴 쉰', 24, NULL),
	(NULL, '제시 플레먼스', 24, NULL),
	(NULL, '강하늘', 25, NULL),
	(NULL, '천우희', 25, NULL),
	(NULL, '이설', 25, NULL),
	(NULL, '이양희', 25, NULL),
	(NULL, '빈 디젤', 26, NULL),
	(NULL, '존 시나', 26, NULL),
	(NULL, '성 강', 26, NULL),
	(NULL, '샤를리즈 테론', 26, NULL),
	(NULL, '미셸 로드리게즈', 26, NULL),
	(NULL, '조다나 브류스터', 26, NULL),
	(NULL, '엠마 스톤', 27, NULL),
	(NULL, '엠마 톰슨', 27, NULL),
	(NULL, '마크 스트롱', 27, NULL),
	(NULL, '에밀리 비샴', 27, NULL),
	(NULL, '폴 월터 하우저', 27, NULL),
	(NULL, '제이슨 스타뎀', 28, NULL),
	(NULL, '스콧 이스트우드', 28, NULL),
	(NULL, '조휘 하트넷', 28, NULL),
	(NULL, '포스트 말론', 28, NULL),
	(NULL, '홀트 맥칼라니', 28, NULL),
	(NULL, '베라 파미가', 29, NULL),
	(NULL, '패트릭 윌슨', 29, NULL),
	(NULL, '줄리안 힐리아드', 29, NULL),
	(NULL, '로우리 오코너', 29, NULL),
	(NULL, '등은희', 30, NULL),
	(NULL, '이감', 30, NULL),
	(NULL, '이감22', 30, NULL);
	
	
	하고나서 actorid  안쓰는  컬럼삭제
	alter table actor drop actorid;
	alter table actor drop birthdata;
	
	
	
	
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
