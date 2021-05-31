package com.model;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import lombok.Data;

@Data
public class SalesDTO {
	
	//SALES 테이블 관련( 칼럼과 순서 동일)
	
	int sales_index; // sales 테이블의auto increment index값.
	int timetableidx;// movietime테이블의  index 
	String sectorNo;
	
	int salesprice; // 구매금액내지 환불금
	String userid="";
	String people;
	
	int  m_index;  // 영화정보 테이블 (movieinfo)index!!
	String movietitle; //영화제목
	String sales_type; // 현금, 카드 내지 환불
	Date sales_time;
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	//매출정보 조회시 검색카테고리 검색키워드 
	String salesckind="";// ticket_index, userid, movietitle, sectorNo 
	String salescword=""; 
	
	String moviesector;

	
	
	
	// 월별정보 추출용
	String daysaletime;

	
	
	
	// 정산 테이블 관련
	int sumall=0; 
	int totalsale=0;
	int totalrefund=0;
	Date monthdate;
	
	String firstday;
	

	int ticket_index; // 예매테이블index 값. (auto increment)
	// 이걸로 관련정보 뽑아오기 가능.
	

}
