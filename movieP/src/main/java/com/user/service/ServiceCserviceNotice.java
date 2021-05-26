package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.admin.service.ServiceNotiListDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCserviceNotice implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session) {
		
		System.out.println("빈 이름 serviceCserviceNotice 소환됨");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("npDTO", npDTO);
		map.put("sfDTO", sfDTO);
		
		npDTO.init(db, map);
		
		ServiceNotiListDTO res= new ServiceNotiListDTO();
		
		res.setSfdto(db.noticelist(map));// sfdto 는 리스트.. 흠?
		res.setOnesfdto(sfDTO);
		res.setSnpdto(npDTO);

		
		return res;// 이 res 안에 있는 sfdto
	}


}
