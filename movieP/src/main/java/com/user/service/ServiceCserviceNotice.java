package com.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceNoticeDTO;

@Service
public class ServiceCserviceNotice implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(Object obj) {
		
		System.out.println("빈 이름 serviceCserviceNotice 소환됨");
		//service라는 이름의 키로 >  table 이름을 담는 클래스 dto? 
		

		List<ServiceNoticeDTO> result=db.noticelist();
		
		System.out.println("db갓"+result.size());
		
		return result;
	}
	
}
