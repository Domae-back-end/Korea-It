package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;
@Service
public class Pageeditfaqlist implements SalesService, PageeditService {
	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		
		HashMap<String, Object> orimap = (HashMap) obj;		
		ServiceFullDTO sfdto= (ServiceFullDTO)orimap.get("sfDTO");
		ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
		
		HashMap<String,Object> map= new HashMap<String, Object>();
		
		map.put("sfDTO", sfdto);
		map.put("npDTO", npDTO);		
		System.out.println("돌리기전:"+npDTO);
		npDTO.initfaq(db, map);
		
	
		
		HashMap<String, Object> result = new HashMap<String, Object>();	
		map.put("npDTO", npDTO);//init 돌린뒤의 npDTO/	
		System.out.println("돌린후:"+npDTO);
		result.put("sfDTO", db.getfaq(map));		
		result.put("npDTO", result);
		
		
		return result;
	}

}
