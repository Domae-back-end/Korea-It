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

-- 테이블 unoestellar.cate 구조 내보내기
CREATE TABLE IF NOT EXISTS `cate` (
  `m_index` int(11) DEFAULT NULL,
  `cate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 unoestellar.cate:~51 rows (대략적) 내보내기
DELETE FROM `cate`;
/*!40000 ALTER TABLE `cate` DISABLE KEYS */;
INSERT INTO `cate` (`m_index`, `cate`) VALUES
	(1, '드라마'),
	(2, '판타지'),
	(2, '모험'),
	(3, '드라마'),
	(4, '드라마'),
	(5, '액션'),
	(5, '드라마'),
	(5, '스릴러'),
	(6, '액션'),
	(6, '드라마'),
	(7, '애니메이션'),
	(7, '모험'),
	(7, '가족'),
	(7, '판타지'),
	(8, '액션'),
	(8, 'SF'),
	(9, '액션'),
	(9, '범죄'),
	(9, '드라마'),
	(10, '모험'),
	(10, '드라마'),
	(10, '가족'),
	(11, '드라마'),
	(12, '드라마'),
	(13, '범죄'),
	(14, '드라마'),
	(15, '드라마'),
	(16, '멜로/로맨스'),
	(16, '드라마'),
	(17, '액션'),
	(17, '모험'),
	(18, '드라마'),
	(19, '애니메이션'),
	(20, '애니메이션'),
	(21, '드라마'),
	(22, '공포'),
	(22, '스릴러'),
	(23, '드라마'),
	(24, '드라마'),
	(25, '드라마'),
	(25, '멜로/로맨스'),
	(26, '액션'),
	(27, '드라마'),
	(27, '범죄'),
	(27, '코미디'),
	(28, '액션'),
	(29, '공포'),
	(29, '미스터리'),
	(29, '스릴러'),
	(30, '드라마'),
	(30, '멜로/로맨스'),
	(31, '스릴러'),
	(32, '액션'),
	(32, '코미디'),
	(32, '범죄');
/*!40000 ALTER TABLE `cate` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
