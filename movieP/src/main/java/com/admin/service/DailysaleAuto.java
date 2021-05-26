package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;

@Service
public class DailysaleAuto {
	

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Resource
	DbMapper db;
	
	
	public void dailysaleDo() {
		//Date calcdate = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateForm2 = new SimpleDateFormat("yyyy-MM-01");
		// 일일체크
		String day = dateForm.format(cal.getTime());
		cal.add(Calendar.DATE, -1);// 어제의 것을.
		day = dateForm.format(cal.getTime());
		// 월체크
		String monthdate = dateForm2.format(cal.getTime());
		logger.info("월정산가게될날짜"+monthdate);
		logger.info("검색해서 뽑아올 날짜:"+ day);
		
		SalesDTO salesDTO = new SalesDTO();
		salesDTO.setDaysaletime(day);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("day", day);
		
		logger.info("몇개 오냐"+
		db.getyesterdaysales(map).size());
		HashSet<String> aa= new HashSet<String>();
		if(db.getyesterdaysales(map).size()>0)
		for (SalesDTO ss : db.getsales(map)) {
			
		}
		

		
		
		


		
		
		
		
		
		
		
//		}
		
	}
	
	
	

}
