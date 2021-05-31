package com.user.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCqnainsertReg implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session) {
		System.out.println("빈 이름 serviceCqnainsertReg 소환됨dddddddddd");
		
		AlterDTO ad = new  AlterDTO();

		
		
		
		if (sfDTO.getPerstitle().isEmpty()) {
			
			ad.setMsg("ㅂㅂ");
			ad.setUrl("/user/serviceC/servicePersonal");
			return ad;
		}
		
		
		System.out.println("성공이야");
		
		sfDTO.setPersid((String)session.getAttribute("sessionId"));
		db.insertPersQna(sfDTO);
		

		
		ad.setMsg("1대1 문의가 등록되었습니다!");
		ad.setUrl("/user/serviceC/servicePersonal");
		
		return ad;
		
	}

	
}
