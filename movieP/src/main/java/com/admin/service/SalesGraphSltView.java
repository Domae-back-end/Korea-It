package com.admin.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
@Service
public class SalesGraphSltView implements SalesService {


	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		//재료
		Map<String,String> parmap= (HashMap<String, String>)obj;
		System.out.println(parmap.get("startyear"));
		System.out.println(parmap.get("endyear"));
		
		//반환
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("message", 500);
		result.put("message2", "문자열열");
		
		
		
		return result;
	}

}
