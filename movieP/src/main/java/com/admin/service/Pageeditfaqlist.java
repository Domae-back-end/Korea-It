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
public class Pageeditfaqlist implements SalesService, PageeditService {
	@Resource
	DbMapper db;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Override
	public Object execute(Object obj) {
		
		HashMap<String, Object> orimap = (HashMap) obj;		
		ServiceFullDTO sfdto= (ServiceFullDTO)orimap.get("sfDTO");
		ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
		npDTO.setTablename("basicqna");
		
		
		
		HashMap<String,Object> map= new HashMap<String, Object>();
		
		//최종결과
		AdminListDTO res= new AdminListDTO();
		HashMap<String, Object> totalmap = new HashMap<>();
		
		totalmap.put("sfDTO", sfdto);
		totalmap.put("pDTO", npDTO);		
		npDTO.initfaq(db, totalmap);
		
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();	
		map.put("npDTO", npDTO);//init 돌린뒤의 npDTO/	
		result.put("sfDTO", db.getfaq(map));		
		result.put("npDTO", result);
		
		
		return result;
	}

}
