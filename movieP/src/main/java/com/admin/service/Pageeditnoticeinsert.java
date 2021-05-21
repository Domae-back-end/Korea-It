package com.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;

//Service단
@Service
public class Pageeditnoticeinsert implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		
		
		System.out.println("빈 이름 Pageeditnoticeinsert 소환됨");
		//service라는 이름의 키로 >  table 이름을 담는 클래스 dto? 
		
		
		//List<ServiceNoticeDTO> result = 
				
			//	db.insertNotice();
		
		//System.out.println("db갓"+result.size());
		
		return null;
	}

	
}
