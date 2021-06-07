package com.model;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import lombok.Data;

@Data
public class MovieTimeDTO {
	// movieTimeDTO
	Integer time_index;
	String movietitle, sectorno, dal, el;
	Date starttime, endtime, reg_date;

	String search;
	String time;
	String check;
	String endReg_date;
	Date endReg_date_re;
	String dayto;
	String deletetime;

	SimpleDateFormat sdf = new SimpleDateFormat("HHmm");
	SimpleDateFormat timeDate = new SimpleDateFormat("HH:mm:00"); 

	public int getStarttimeInt() {
		return timeToInt(starttime) / 10 * 10;
	}

	public int getEndtimeInt() {

		int buf = timeToInt(endtime);
		int res = buf / 10;
		if (buf % 10 != 0)
			res++;
		return res * 10;
	}

	int timeToInt(Date dt) {
		return Integer.parseInt(sdf.format(dt));
	}

	public Date getTimeDate(String time) {
		Calendar ar = Calendar.getInstance();

		String hour = time.substring(0, 2);
		String min = time.substring(2, 4);
		try {
			ar.setTime(timeDate.parse(hour+":"+min+":00"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ar.getTime();
	}

	public Date getEndTimeDate(int mplaytime, Date starttime) {
		Calendar ar = Calendar.getInstance();
		ar.setTime(starttime);
		ar.add(Calendar.MINUTE, mplaytime);
		return ar.getTime();
	}

	public Date getRegDate(String dal, String el) {
		Calendar ar = Calendar.getInstance();
		ar.set(Calendar.MONTH, Integer.parseInt(dal)-1);
		ar.set(Calendar.DATE, Integer.parseInt(el));
		return ar.getTime();
	}
	
	public MovieTimeDTO getEndRegDate(MovieTimeDTO mdto) {
		SimpleDateFormat year = new SimpleDateFormat("yyyy-MM-dd"); 
		try {
			mdto.setEndReg_date_re(year.parse(mdto.getEndReg_date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mdto;
	}
}
