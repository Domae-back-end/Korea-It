package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.admin.service.ServiceNotiListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceHistory implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;


	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session) {

		System.out.println("빈 이름 ServiceCserviceHistory 소환됨");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		
		System.out.println(session.getAttribute("sessionId"));
		
		
		
		if (session.getAttribute("sessionId") == null) {
			sfDTO.setPersid(null);

		}else {
			sfDTO.setPersid((String)session.getAttribute("sessionId"));
		}
		
		
		
		map.put("npDTO", npDTO);
		map.put("sfDTO", sfDTO);
		map.put("request", request);
		
		npDTO.initpershistory(db, map);
		
		ServiceNotiListDTO res= new ServiceNotiListDTO();
		res.setSfdto(db.pershistory(map));
		res.setSnpdto(npDTO);
		res.setOnesfdto(sfDTO);
		System.out.println(sfDTO);
		
		
		
		
		
		
		
//		sfDTO.setPersid((String)session.getAttribute("id"));
//
//		
//		//진짜.
//		persDTO.setPersid((String)session.getAttribute("id"));
//		persDTO.setPersimg(persDTO.getFile().getOriginalFilename());
//		
		
		
		
		
		
		
		return res;
//		return null;
	}



}
