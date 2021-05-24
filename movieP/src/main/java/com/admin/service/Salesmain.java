package com.admin.service;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieSect;
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
		
		if(MovieSect.NORM1.equals("기존1관")){
			System.out.println("true");
		}
	if(request.getParameter("userid")!=null)	{
		if(!request.getParameter("userid").equals("")) {
		logger.info("파라미터userid:"+request.getParameter("userid"));
		return db.getsalesbyId(request.getParameter("userid"));
		}
	}
	HashMap<String, Object> map = new HashMap<String, Object>();
		
	
	return db.getsales(map);
}
	
	
}
