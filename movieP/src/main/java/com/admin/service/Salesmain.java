package com.admin.service;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;

@Service
public class Salesmain implements SalesService{


	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Resource
	DbMapper db;	

	
	@Override
	public Object execute(Object obj) {//request sadto
		logger.info("salesMain");
		HashMap<String, Object> orimap = (HashMap)obj;
		HttpServletRequest request= (HttpServletRequest)orimap.get("request");
		SalesDTO sadto = (SalesDTO)orimap.get("sadto");
		
		logger.info("검색유저id"+sadto.getUserid());	
		
		
		
		
		
			
	
	

	
	
	
	
	return db.getsales(orimap);
}
	
	
}
