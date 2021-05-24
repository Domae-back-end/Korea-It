package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;

@Service
public class DailysaleAuto {
	
	@Resource
	DbMapper db;
	
	
	public void dailysaleDo() {
		//Date calcdate = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		String day = dateForm.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		day = dateForm.format(cal.getTime());
		
		
		SalesDTO salesDTO = new SalesDTO();
		salesDTO.setDaysaletime(day);
		db.insertdaysale(salesDTO);
		
//		String calcday = calcdate.getYear()+"-";
//		String monthz = "0";
//		if(calcdate.getMonth()<10) {
//			calcday=monthz+calcdate.getMonth();
//		}
		
	}
	
	
	

}
