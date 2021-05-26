package com.user.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.admin.service.ServiceNotiListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceHistoryDetail implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	


	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session) {
		System.out.println(session.getAttribute("sessionId"));

		
		if (session.getAttribute("sessionId") == null) {
			sfDTO.setPersid(null);

		}else {
			sfDTO.setPersid((String)session.getAttribute("sessionId"));
		}
		
		
		
		ServiceNotiListDTO res= new ServiceNotiListDTO();
		res.setOnesfdto(sfDTO);
		
		
		
		return res;
	}



	
}
