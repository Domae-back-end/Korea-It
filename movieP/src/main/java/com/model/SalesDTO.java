package com.model;

import java.text.SimpleDateFormat;
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
	
	Date salesstime;
	Date salesetime;
	
	
	public void setStarttime(String datevalue){
		
		if(datevalue!=null&&!datevalue.equals("")) {
		System.out.println("스타트타임:"+datevalue);
		String[] arr= datevalue.split("-");
		salesstime= new Date(Integer.parseInt(arr[0])-1900, Integer.parseInt(arr[1])-1,Integer.parseInt(arr[2]));	
		}else {
			salesstime=null;
		}
	}
	
	public void setEndtime(String datevalue){
		if(datevalue!=null&&!datevalue.equals("")) {// null 은 아니구나ㅏ. 그러나 빈칸으로 오는구나. 라는것이 검증됨.
		System.out.println("엔드타임:"+datevalue);
		String[] arr= datevalue.split("-");
		salesetime= new Date(Integer.parseInt(arr[0])-1900, Integer.parseInt(arr[1])-1,Integer.parseInt(arr[2]));
		salesetime.setHours(23);salesetime.setMinutes(59);salesetime.setSeconds(59);;
		}else {
			salesetime=null;
		}
	}
	
	public String getStarttime(){
		SimpleDateFormat sdf= new SimpleDateFormat("YYY-MM-dd");
		//sdf= new SimpleDateFormat("YYY&#39;-&#39;MM&#39;-&#39;dd");
		
		if(salesstime!=null) {
		System.out.println(sdf.format(salesstime));
		return sdf.format(salesstime);
		}else {
			return null;
		}
		
	}//

	
	public String getEndtime(){
		SimpleDateFormat sdf= new SimpleDateFormat("YYY-MM-dd");
		//sdf= new SimpleDateFormat("YYY&#39;-&#39;MM&#39;-&#39;dd");
		if(salesetime!=null) {
		System.out.println(sdf.format(salesetime));
		return sdf.format(salesetime);
		}else {
			return null;
		}
		
	}//
	
	public String getMonthman() {
		SimpleDateFormat sdf= new SimpleDateFormat("YYY-MM");
		return sdf.format(monthdate);
	}
	
	
	
	
	
	
	
	
	//매출정보 조회시 검색카테고리 검색키워드 
	String salesckind="";// ticket_index, userid, movietitle, sectorNo 
	String salescword=""; 
	
	String moviesector;

	
	
	
	// 월별정보 추출용
	String daysaletime;

	
	
	
	// 정산 테이블 관련
	int sumall=0,sumalll=0; 
	int totalsale=0;
	int totalrefund=0;
	Date monthdate,monthdatee;
	
	
	
	String firstday;
	

	int ticket_index; // 예매테이블index 값. (auto increment)
	// 이걸로 관련정보 뽑아오기 가능.
	

}
