package com.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import lombok.Data;

@Data
public class MovieTimeDTO {
	//movieTimeDTO
	Integer time_index;
	String movietitle, sectorno, starttime1,dal,el;
	Date starttime, endtime, reg_date;
	
	String reg_datelist;
	String m_indexlist;
	String sectornolist;

	String search;//
	
	public ArrayList<MovieTimeDTO> getList(){

		String[] buf1 = starttime1.split(",");
		String[] buf2 = reg_datelist.split(",");
		String[] buf3 = m_indexlist.split(",");
		String[] buf4 = sectornolist.split(",");
		
		ArrayList<MovieTimeDTO> ar = new ArrayList<>();

		for (int i = 0; i < buf3.length; i++) {
			MovieTimeDTO buf = new MovieTimeDTO();
			buf.setTime_index(Integer.parseInt(buf3[i]));
			Calendar day = Calendar.getInstance();
			day.set(Calendar.HOUR, Integer.parseInt(buf1[i].split(":")[0]));
			day.set(Calendar.MINUTE, Integer.parseInt(buf1[i].split(":")[1]));
			day.set(Calendar.SECOND, Integer.parseInt(buf1[i].split(":")[2]));

			day.set(Calendar.YEAR, Integer.parseInt(buf2[i].split("-")[0]));
			day.set(Calendar.MONTH, (Integer.parseInt(buf2[i].split("-")[1])-1));
			day.set(Calendar.DATE, Integer.parseInt(buf2[i].split("-")[2]));
			buf.setSectorno(buf4[i]);
			buf.setReg_date(day.getTime());
			buf.setStarttime(day.getTime());
			buf.setTime_index(Integer.parseInt(buf3[i]));
			ar.add(buf);
		}
		
		return ar;
	}

}
