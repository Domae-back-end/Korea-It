drop table basicqna;

create table basicqna (
	bqindex int(11) primary key auto_increment,
	bqcate varchar(100),
	bqtitle varchar(100),
	bqcont varchar(1000),
	viewcnt int(11)
);

insert into  basicqna (bqcate, bqtitle, bqcont, viewcnt) values
('영화관','title0','cont0',30),
('영화/예매','title1','cont1',16),
('영화/예매','title2','cont2',8),
('영화/예매','title3','cont3',3),
('가입','title4','cont4',58),
('영화/예매','title5','cont5',33),
('영화관','title6','cont6',44),
('영화/예매','title7','cont7',3),
('영화/예매','title8','cont8',50),
('가입','title9','cont9',24),
('가입','title10','cont10',18),
('가입','title11','cont11',53),
('가입','title12','cont12',40),
('영화관','title13','cont13',43),
('영화관','title14','cont14',45),
('영화관','title15','cont15',2),
('영화/예매','title16','cont16',6),
('영화관','title17','cont17',9),
('영화/예매','title18','cont18',24),
('영화/예매','title19','cont19',31),
('가입','title20','cont20',25),
('영화관','title21','cont21',27),
('영화관','title22','cont22',43),
('영화관','title23','cont23',44),
('가입','title24','cont24',3),
('영화/예매','title25','cont25',19),
('영화/예매','title26','cont26',21),
('영화/예매','title27','cont27',55),
('영화/예매','title28','cont28',12),
('영화/예매','title29','cont29',9);

