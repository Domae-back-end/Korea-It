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
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO) {

//		System.out.println("빈 이름 ServiceCserviceHistory 소환됨");
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		HttpServletRequest request = (HttpServletRequest)map.get("request");
//		
//		HttpSession session = request.getSession();
//		
//		if (session.getAttribute("sessionId") == null) {
//			
//			return "member/login/loginForm";
//		}
//		
//		
//		
//		map.put("npDTO", npDTO);
//		map.put("sfDTO", sfDTO);
//		map.put("request", request);
//		
//		npDTO.initpershistory(db, map);
//		
//		ServiceNotiListDTO res= new ServiceNotiListDTO();
//		res.setSfdto(db.pershistory(map));
//		res.setSnpdto(npDTO);
//		
//		sfDTO.setPersid((String)session.getAttribute("id"));
		
		
		
		
		
		
//		HttpServletRequest request = (HttpServletRequest)map.get("request");
//		//상상 .
//		HttpSession session = request.getSession();
//		// 가짜..
//		session.setAttribute("id", "bbb111");
//		
//		
//		//진짜.
//		persDTO.setPersid((String)session.getAttribute("id"));
//		persDTO.setPersimg(persDTO.getFile().getOriginalFilename());
//		
//		System.out.println("1:1문의등록내용:" +persDTO);
//		System.out.println("파일이름:"+persDTO.getFile().getOriginalFilename());
		
		
		
		
		
		
		
		
//		return res;
		return null;
	}



}
