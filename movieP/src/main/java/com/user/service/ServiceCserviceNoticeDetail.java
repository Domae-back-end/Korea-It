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


//		next글:null
//		before글:ServiceFullDTO(kind2=null, schkey=null, noticeindex=107, noticecate=movie, noticetitle=번호는 107번이지롱, noticecont=107번 글이다?

		
		ServiceNoticeBNDTO res = new ServiceNoticeBNDTO();
		res.setNow(db.noticedetail(sfDTO));
		res.setBefore(before);
		res.setNext(next);
		res.setNpDTO(npDTO);
		
//		if (next == null) {
//			System.out.println("next가 널이다.");
//		}
		
		return res;
	}
	
	


	
}
