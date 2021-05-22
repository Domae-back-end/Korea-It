package com.admin.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;
@Service
public class Pageeditfaqinsert implements  PageeditService {
	
	
	


	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {

		HashMap<String, Object> orimap = (HashMap) obj;		
		HttpServletResponse write = (HttpServletResponse)orimap.get("response");
		 PrintWriter out_write;
		
		
		return "자찾질쓰기";
	}

}
