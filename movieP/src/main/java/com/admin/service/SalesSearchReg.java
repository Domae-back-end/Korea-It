package com.admin.service;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieSect;
import com.model.SalesDTO;

@Service
public class SalesSearchReg implements SalesService{


	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Resource
	DbMapper db;	

	
	@Override
	public Object execute(Object obj) {//request sadto
		logger.info("SalesSearchReg 들어옴.");
		HashMap<String, Object> orimap = (HashMap)obj;
		HttpServletRequest request= (HttpServletRequest)orimap.get("request");
		SalesDTO sadto = (SalesDTO)orimap.get("sadto");
		
		logger.info("검색유저id"+sadto.getUserid());	
		
		if(MovieSect.NORM1.equals("기존1관")){
			System.out.println("true");
		}
		AlterDTO al = new AlterDTO();	
		
				al.setMsg("매출리스트 검색합니다 -id:"+sadto.getUserid());
				al.setUrl("/admin/sales/main");
				if(sadto.getUserid()!=null&&!sadto.getUserid().equals("")) {
				al.setUrl("/admin/sales/main?userid="+sadto.getUserid());
				}

	
	return al;
}
	
	
}
