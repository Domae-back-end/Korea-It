package com.model;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import lombok.Data;

@Data
public class SalesDTO {
	int sales_index; // sales 테이블의 index값.
	int ticket_index; // 예매테이블index 값. (auto increment)
	// 이걸로 관련정보 뽑아오기 가능.
	int ticket_pcount;// 예매인원
	int salesprice; // 구매금액

	// 포인트개념.. x
	String userid;
	String movietitle;
	String moviesector;
	String sales_type; // 현금, 카드 내지 환불
	Date sales_time;

	// daysaletime,sumall,totalsale,totalrefund)

	String daysaletime;
	// 월별정보 추출용

	int sumall;
	int totalsale;
	int totalrefund;
	Date monthdate;
	String sectorCode;
	String firstday;

}
