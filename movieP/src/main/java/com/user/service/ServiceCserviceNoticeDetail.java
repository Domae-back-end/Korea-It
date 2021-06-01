package com.user.service;

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
public class ServiceCserviceNoticeDetail implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, HttpServletRequest request, MultipartFile file) {
		
		db.addCount(sfDTO);
		
		if (session.getAttribute("sessionId") == null) {
			sfDTO.setPersid(null);

		}else {
			sfDTO.setPersid((String)session.getAttribute("sessionId"));
		}
		
		ServiceFullDTO next = db.noticeNext(sfDTO);
		ServiceFullDTO before = db.noticeBefore(sfDTO);
		
		System.out.println("next글:"+next);
		System.out.println("before글:"+before);


		ServiceNotiListDTO res = new ServiceNotiListDTO();
		res.setNow(db.noticedetail(sfDTO));
		res.setBefore(before);
		res.setNext(next);
		res.setNpDTO(npDTO);
		res.setOnesfdto(sfDTO);

		return res;
	}
	
	


	
}
