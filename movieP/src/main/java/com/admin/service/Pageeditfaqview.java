package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.AdminListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;
@Service
public class Pageeditfaqview implements SalesService, PageeditService {
	@Resource
	DbMapper db;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Override
	public Object execute(Object obj) {
		
		HashMap<String, Object> orimap = (HashMap) obj;		
		ServiceFullDTO sfDTO= (ServiceFullDTO)orimap.get("sfDTO");
		
		HashMap<String, Object> result = new HashMap<String, Object>();	
		result.put("sfdto",sfDTO);
		
		return result;
	}

}
