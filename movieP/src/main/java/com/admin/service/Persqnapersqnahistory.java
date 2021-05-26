package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

@Service
public class Persqnapersqnahistory implements PageeditService {
	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {// map
		HashMap<String, Object> orimap = (HashMap) obj;
		ServiceNoticePageDTO snpdto = (ServiceNoticePageDTO) orimap.get("snpdto");
		ServiceFullDTO sfdto = (ServiceFullDTO) orimap.get("sfdto");
		HttpServletRequest request = (HttpServletRequest)orimap.get("request");

		
		
	
		
		
		
		HashMap<String, Object> map = new HashMap<>();
		ServiceNotiListDTO res = new ServiceNotiListDTO();
		map.put("snpdto", snpdto);
		map.put("sfdto", sfdto);
		
		if (sfdto.getPerscate() == null) {

			snpdto.initpers2(db, map);
			res.setSfdto(db.perslistans(map));
			res.setSnpdto(snpdto);
			return res;
		}
		

		snpdto.initpers(db, map);
		res.setSfdto(db.perslistanscate(map));
		res.setSnpdto(snpdto);

		return res;
	}

}
