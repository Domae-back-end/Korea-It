package com.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
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
public class SalesGraphSltView implements SalesService {



	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	DbMapper db;

	@Override
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
		while(res.iterator().hasNext() ) {
			logger.info(res.iterator().next().toString());
		}
		
		//반환
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("message", 500);
		result.put("message2", "문자열열");
		result.put("answer", "no");
		
		
		
	
		
		
		return result;
	}

}
