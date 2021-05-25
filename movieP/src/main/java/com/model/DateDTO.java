package com.model;

import java.sql.Time;
import java.util.Date;

import lombok.Data;

@Data
public class DateDTO {
	Date reg_date;
	Date endtime;
	
	Date end_time;
	
	public void setEnd_time() {
		Date dd = new Date();
		dd.setYear(this.reg_date.getYear());
		dd.setMonth(this.reg_date.getMonth());
		dd.setDate(this.reg_date.getDate());
		dd.setDate(this.endtime.getHours());
		dd.setMinutes(this.endtime.getMinutes());
		dd.setSeconds(this.endtime.getSeconds());
		
		end_time = dd;
		System.out.println("red_date: "+reg_date);
		System.out.println("endtime: "+endtime);
		System.out.println("끝나는 시각 날짜 저장한 것 확인: "+end_time);
	}
	
	
}
