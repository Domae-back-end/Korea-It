create table movietime (
	time_index int auto_increment primary key,
	movietitle varchar(100),
	sectorNo varchar(100),
	starttime time,
	endtime time,
	reg_date date
);

create table ticketing(
	m_index int auto_increment primary key,
	time_index int,
	people varchar(30),
	seatNo varchar(30),
	userid varchar(100)
);
