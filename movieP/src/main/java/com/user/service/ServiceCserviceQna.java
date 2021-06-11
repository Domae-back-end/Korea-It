package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.admin.service.ServiceNotiListDTO;
import com.model.AdminListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceQna implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, 
		HttpServletRequest request, MultipartFile file) {
		
		npDTO.setTablename("basicqna");
		if (session.getAttribute("sessionId") == null) {
			sfDTO.setPersid(null);

		}else {
			sfDTO.setPersid((String)session.getAttribute("sessionId"));
		}
		
		
		HashMap<String,Object> map= new HashMap<String, Object>();
		
		
		
		System.out.println("전				"+npDTO);
		npDTO.setLimit(10);
		map.put("sfDTO", sfDTO);
		map.put("npDTO", npDTO);	
		npDTO.initfaq(db, map);
		System.out.println("후			"+npDTO);
	
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();	
		result.put("sfdto",sfDTO);
		result.put("sfList", db.getfaq(map));		
		result.put("pdto", npDTO);
		
		
		System.out.println("이번에나올게시물수:"+db.getfaq(map).size());
		
		
		
		return result;
	}

	
}
