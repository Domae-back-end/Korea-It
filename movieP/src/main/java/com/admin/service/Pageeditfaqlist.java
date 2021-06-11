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
		ServiceFullDTO sfDTO= (ServiceFullDTO)orimap.get("sfDTO");
		ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
		//qna에서뽑아와야지..
		npDTO.setTablename("basicqna");
		
		HashMap<String,Object> map= new HashMap<String, Object>();
		
		//최종결과
		AdminListDTO res= new AdminListDTO();
		HashMap<String, Object> totalmap = new HashMap<>();
		System.out.println("전				"+npDTO);
		npDTO.setLimit(10);
		totalmap.put("sfDTO", sfDTO);
		totalmap.put("npDTO", npDTO);		
		npDTO.initfaq(db, totalmap);
		System.out.println("후			"+npDTO);
	
		//
		HashMap<String, Object> result = new HashMap<String, Object>();	
		map.put("npDTO", npDTO);//init 돌린뒤의 npDTO/	
		map.put("sfDTO",sfDTO);
		result.put("sfdto",sfDTO);
		result.put("sfList", db.getfaq(map));		
		result.put("pdto", npDTO);
		
		System.out.println("이번에나올게시물수:"+db.getfaq(map).size());
		
		
		
		return result;
	}

}
