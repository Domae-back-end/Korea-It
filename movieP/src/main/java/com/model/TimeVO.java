package com.model;

import java.util.Date;

import lombok.Data;
@Data
public class TimeVO {
	
	int date;
	int month;
	int year;
	int hour;
	int minute;
	int second;
	
	String dal;
	String el;
	String startdate;// 매출 검색 시작날짜
	String enddate;// 매출 검색 끝날짜
	
	Date timedata;
	
	
	
	

}
