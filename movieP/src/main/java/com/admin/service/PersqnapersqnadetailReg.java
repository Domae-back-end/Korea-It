package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class PersqnapersqnadetailReg implements PageeditService {
			 

	@Resource
	DbMapper db;
	
	

	@Override
	public Object execute(Object obj) {//map
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO snpdto = (ServiceNoticePageDTO) orimap.get("snpdto");
		ServiceFullDTO sfdto = (ServiceFullDTO) orimap.get("sfdto");
		
		System.out.println(sfdto);
		db.persans(sfdto);
		
		AlterDTO al = new AlterDTO();
		al.setMsg("답변이 완료되었습니다");
		al.setUrl("/admin/persqna/persqnanew");
		
		return al;
	}
	
	
}
