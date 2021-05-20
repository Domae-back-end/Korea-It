package com.model;

import java.util.Date;

import lombok.Data;
@Data
public class TimeVO {
	
	Integer date;
	Integer date2;
	Integer month;
	Integer month2;
	Integer year;
	Integer year2;
	Integer hour;
	Integer hour2;
	Integer minute;
	Integer second;
	
	String dal;
	String el;
	String sym;
	String eym;
	String startdate;// 매출 검색 시작날짜
	String enddate;// 매출 검색 끝날짜
	
	Date timedata;

	public TimeVO(  int year,int month, int year2,int month2) {
		super();
		this.month = month;
		this.month2 = month2;
		this.year = year;
		this.year2 = year2;
		
		
		if(month<10)
		this.sym=year+"-0"+month;
		else {
			this.sym=year+"-"+month;
		}
		if(month2<10) {
		this.eym=year2+"-0"+month2;}else {
			this.eym=year2+"-"+month2;
		}
	}
	
	public TimeVO() {
		// TODO Auto-generated constructor stub
	}
	
	

}
