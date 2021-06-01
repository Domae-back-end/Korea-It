package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;
import com.model.TimeVO;
@Service
public class SalesGraphRefunds implements SalesService {



	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	DbMapper db;

	@Override // 
	public Object execute(Object obj) {// AJAX Service
		//재료
		Map<String,String> json= (HashMap<String, String>)obj;
		System.out.println(json.get("startyear"));
		System.out.println(json.get("endyear"));
		
		TimeVO timevo= new TimeVO( Integer.parseInt(json.get("startyear")),
				Integer.parseInt(json.get("startmonth")),
				Integer.parseInt(json.get("endyear")),
				Integer.parseInt(json.get("endmonth")));
		
		System.out.println(timevo);
		List<SalesDTO> res  =  db.getMonthlygraph(timevo);
		
		System.out.println("몇개나오는가"+res.size());
		
		//반환
		LinkedHashMap<String, Object> result = new LinkedHashMap<String, Object>();
		
		result.put("answer", "no");
		if(res.size()>0) {
			result.put("answer","yes");
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM");
			
			
		//	
			for (SalesDTO ss : res) {
				result.put(sdf.format(ss.getMonthdate())+"-"+ss.getSectorNo(), ss.getSumall());
				System.out.println(res.indexOf(ss)+","+sdf.format(ss.getMonthdate())+"-"+ss.getSectorNo());
			}
		}
		
		
		
		
	
		
		
		return result;
	}

}
