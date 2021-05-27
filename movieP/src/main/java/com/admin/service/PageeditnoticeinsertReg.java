package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class PageeditnoticeinsertReg implements PageeditService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		System.out.println("빈 이름 PageeditnoticeinsertReg 소환됨");
		
		HashMap<String, Object> map= (HashMap)obj;
		ServiceFullDTO sfDTO = (ServiceFullDTO)map.get("sfDTO");
		
		
		db.insertNotice(sfDTO);

		AlterDTO ad = new  AlterDTO();
		
		ad.setMsg("공지등록 완료");
		ad.setUrl("/admin/pageedit/noticelist");
		
		return ad;
		
		
		//return null;
		
	}

	
}
