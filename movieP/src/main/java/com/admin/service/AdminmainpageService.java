package com.admin.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;






@Service
public class AdminmainpageService implements Admincoreservice{

@Resource
DbMapper db;

@Override
public Object execute(Map<String, Object> obj) {
	
	HashMap<String, Object> resultmap = new HashMap<>();
	//1 고객문의 db  
	
	
	
	
	///2 매출
	
	
	
	// 3 FAQ
	
	
	
	//4 최근공지
	
	
	
	
	// 맵하나 내밷고 .
	
	return resultmap;
}

	
	
	
}
