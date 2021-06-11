package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;
@Service
public class ServiceCserviceDetail implements  ServiceCservice {

	@Resource
	DbMapper db;

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, 
			HttpServletRequest request, MultipartFile file) {

		db.addcntfaq(sfDTO);
		HashMap<String, Object> res = new HashMap<>();		
		res.put("sfDTO", db.detailfaq(sfDTO));
		res.put("npDTO", npDTO);
		
		return res;
	}

}
