package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class Persqnapersqnahistory implements PageeditService {
	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {// map
		HashMap<String, Object> orimap = (HashMap) obj;
		ServiceNoticePageDTO snpdto = (ServiceNoticePageDTO) orimap.get("snpdto");
		ServiceFullDTO sfdto = (ServiceFullDTO) orimap.get("sfdto");

		
		HashMap<String, Object> map = new HashMap<>();
		map.put("snpdto", snpdto);
		map.put("sfdto", sfdto);
		
		snpdto.initpers(db, map);

		ServiceNotiListDTO res = new ServiceNotiListDTO();
		res.setSfdto(db.perslistans(map));
		res.setSnpdto(snpdto);

		return res;
	}

}
