package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditnoticeinsert implements PageeditService {
	// wait
	//Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String , Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npdto= (ServiceNoticePageDTO)orimap.get("npDTO");
		
		
		//logger.info("공지 insert 화면 페이지 넘버: "+ npdto.getPage()); // 이제 syso 필요없음.
		
		
		return npdto.getPage();// int 리턴 jsp가 ${data} 알아서 해석
	}

	
}
