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
	seatNo varchar(30),
	userid varchar(100)
);

<!--       seat NO   11,12,1,2  더 좋은 방법?    

	이름 바꿔주는 것이 좋겠다. Vo  .> String  seatNo ; >> 매번 매순간 작업이 필요 ..
	
	일해라 자바야 ... 선택의 문제일 뿐!
		
	foreignkey > 사용이 좋다. 
	데이터 무결성을 위해서 .
	
	포렌키를 잡음으롷서 장점 > 상영표는 13시인데 >   14시의 데이터가  예매된거로 넣으려는 시도!  >> 포린키를 써주면  에러를 낸다! 
	>> 둘러봤는데 14시 없던데?  하면서  잘못된 요청이 실행 실패함. 
	
	>>  안잡은 경우 ?  누군가  관리자가 잘못눌러서  오타데이터  를 넣으면 그게 들어가짐 . 체크 수단이없음 .
	>> 포린키를 쓰면  > 에러가 나고 , 잘못된명령이 원천차단
	
	time index 로 포린키잡기 ..
	
	13번줄 :: db설계중에 정규화 !!
	
	1정규화에 위배되는 상황임.
	
	역정규화 설계법도 물론 존재하기는 한다. 
	
	일단 레코드 관리는 쉬워진다. 
	userid varchar(100) 포린키 잡아야지.
	
	
	
	

-->