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
import com.model.SalesListDTO;
import com.model.SalesPageDTO;

@Service
public class Salesmain implements SalesService{


	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Resource
	DbMapper db;	

	
	@Override
	public Object execute(Object obj) {//request sadto
		HashMap<String, Object> orimap = (HashMap)obj;
		HttpServletRequest request= (HttpServletRequest)orimap.get("request");
		SalesDTO sadto = (SalesDTO)orimap.get("sadto");
		SalesPageDTO pdto = (SalesPageDTO)orimap.get("pdto");
		
		
		logger.info("salesMain");
		logger.info("salesckind"+sadto.getSalesckind()+" 검색어:"+sadto.getSalescword()+"페이지넘버:"+pdto.getPage());	
		logger.info("시작기간"+sadto.getSalesstime()+"~"+sadto.getSalesetime());
		
		
	if(request.getParameter("userid")!=null)	{
		if(!request.getParameter("userid").equals("")) {
		logger.info("파라미터userid:"+request.getParameter("userid"));
		return db.getsalesbyId(request.getParameter("userid"));
		}
	}
	
	
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("sadto",sadto);
	map.put("pdto", pdto);	
	pdto.init(db, map); //pdto의 내용물 변화가온다.
	
	
	
	SalesListDTO result = new SalesListDTO();
	// salist;sadto;pdto;
	//r검색어 있을 때 아닐때 나누어서 .// jsp 에도 페이지정보.카인드 , 검색어정보 뿌려서 .
	result.setSalist(db.getsales(map));
	result.setPdto(pdto);// 제대로된걸 넣어준다.
	result.setSadto(sadto);//검색어카테 기간 들어있
	

	logger.info(result.getSadto().toString());	
	
	return result;
}
	
	
}
