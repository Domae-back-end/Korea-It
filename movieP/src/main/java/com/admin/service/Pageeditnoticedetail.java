package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticeBNDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditnoticedetail implements PageeditService {
	

	@Resource
	DbMapper db;
	
	

	@Override
	public Object execute(Object obj) {//map
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npDTO=   (ServiceNoticePageDTO)orimap.get("npDTO");
		ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");
		
		ServiceFullDTO next = db.noticeNext(sfDTO);
		ServiceFullDTO before = db.noticeBefore(sfDTO);
		
		System.out.println(next+", "+before);
//		
//		ServiceNoticeBNDTO res = new ServiceNoticeBNDTO();
//		res.setNow(db.noticedetail(sfDTO));
//		res.setBefore(before);
//		res.setNext(next);
//		res.setNpDTO(npDTO);
		
		return null;
	}
	
	
}
