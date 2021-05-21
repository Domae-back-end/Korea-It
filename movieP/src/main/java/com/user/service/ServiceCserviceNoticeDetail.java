package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticeBNDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceNoticeDetail implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO) {
		
		db.addCount(sfDTO);
		
		
		ServiceFullDTO next = db.noticeNext(sfDTO);
		ServiceFullDTO before = db.noticeBefore(sfDTO);
		
		System.out.println("next글:"+next);
		System.out.println("before글:"+before);
		
		
		ServiceNoticeBNDTO res = new ServiceNoticeBNDTO();
		res.setNow(db.noticedetail(sfDTO));
		res.setBefore(before);
		res.setNext(next);
		
		return res;
	}
	
	


	
}
