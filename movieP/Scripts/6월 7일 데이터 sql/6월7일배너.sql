

drop table bannerimg;

CREATE TABLE IF NOT EXISTS `bannerimg` (
  `bannerindex` int(11) ,
  `imgurl` varchar(1000),
  `m_index` int(11)
);


INSERT INTO `bannerimg` (`bannerindex`, `imgurl`, `m_index`) VALUES
	(1, 'poster1.jpg', 27),
	(2, 'poster2.jpg', 25),
	(3, 'poster3.jpg', 33),
	(4, 'poster4.jpg', 26),
	(5, 'poster5.jpg', 32);
