package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditnoticelist implements PageeditService {	@Resource
	DbMapper db;
	@Override
	public Object execute(Object obj) {//map
		HashMap<String, Object> orimap = (HashMap)obj;
		
		ServiceNoticePageDTO npDTO=   (ServiceNoticePageDTO)orimap.get("npDTO");
		ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");
		
		System.out.println("빈 이름 Pageeditnoticelist 소환됨 page:"+npDTO.getPage());
		//service라는 이름의 키로 >  table 이름을 담는 클래스 dto? 
		

		HashMap<String, Object> map = new HashMap<>();
		map.put("npDTO", npDTO);
		map.put("sfDTO", sfDTO);
		//
		System.out.println(npDTO+"\n start:"+npDTO.getStart());
		
		npDTO.init(db, map);
		System.out.println("init");
		System.out.println(npDTO+"\n start:"+npDTO.getStart());
		
		ServiceNotiListDTO res= new ServiceNotiListDTO();
		res.setSfdto(db.noticelist(map));
		res.setSnpdto(npDTO);
		
		return res;
	}
	
	
}
