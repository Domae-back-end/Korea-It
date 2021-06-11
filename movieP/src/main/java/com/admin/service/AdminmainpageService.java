package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;

@Service
public class AdminmainpageService implements Admincoreservice{

@Resource
DbMapper db;

@Override
public HashMap<String, Object> execute(HashMap<String, Object> obj) {
	HashMap<String, Object> resultmap = new HashMap<>();
	HashMap<String, Object> orimap = (HashMap) obj;		
	ServiceFullDTO sfDTO= (ServiceFullDTO)orimap.get("sfDTO");
	
	
	resultmap.put("sfdto",sfDTO);
	

	
	//1 고객문의 db  
	resultmap.put("persview", db.persview(resultmap));
	
	
	///2 매출
	
	
	// 3 FAQ	
	resultmap.put("sfview",db.faqview(resultmap));
	
	
	//4 최근공지
	resultmap.put("notiview", db.notiview(resultmap));
	
		
	return resultmap;
}

	
	
	
}
