package com.user.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCservicePersonal implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	

	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}



}
