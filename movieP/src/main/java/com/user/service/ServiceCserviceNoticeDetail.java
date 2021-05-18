package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceNoticeDTO;
import com.model.ServicePersonalDTO;

@Service
public class ServiceCserviceNoticeDetail implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(Object obj) {
//		System.out.println("빈 이름 serviceCserviceNotice 소환됨");
//		
//		HashMap<String, Object> map= (HashMap)obj;
//		ServiceNoticeDTO notiDTO = (ServiceNoticeDTO)map.get("persDTO");
//		
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
//		
//		
//		//재료완성 > 재료 넣어서 메서드.
//		
//		db.insertPersQna(persDTO);
//		
//		
//
//		db.noticelist();
//		System.out.println("db갓");
		
		return null;
	}
	
}
