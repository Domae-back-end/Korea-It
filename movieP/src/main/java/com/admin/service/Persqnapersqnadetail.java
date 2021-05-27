package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class Persqnapersqnadetail implements PageeditService {
	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {// map
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO snpdto = (ServiceNoticePageDTO) orimap.get("snpdto");
		ServiceFullDTO sfdto = (ServiceFullDTO) orimap.get("sfdto");
		
		
		
		ServiceNotiListDTO res = new ServiceNotiListDTO();
		res.setNow(db.persdetail(sfdto));
		res.setNpDTO(snpdto);


		
		
		return res;
	}

}
