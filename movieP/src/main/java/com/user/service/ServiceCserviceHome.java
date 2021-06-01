package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.admin.service.ServiceNotiListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceHome implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, HttpServletRequest request, MultipartFile file) {

		System.out.println("빈 이름 ServiceCserviceHome 소환됨");

		if (session.getAttribute("sessionId") == null) {
			sfDTO.setPersid(null);

		}else {
			sfDTO.setPersid((String)session.getAttribute("sessionId"));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("npDTO", npDTO);
		map.put("sfDTO", sfDTO);
		
		npDTO.init(db, map);
		
		ServiceNotiListDTO res= new ServiceNotiListDTO();
		
		res.setSfdto(db.noticelist(map));// sfdto 는 리스트.. 흠?
		res.setOnesfdto(sfDTO);
		res.setSnpdto(npDTO);

		
		return res;
	}


	
}
