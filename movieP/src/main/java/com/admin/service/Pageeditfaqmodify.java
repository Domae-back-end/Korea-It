package com.admin.service;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;
@Service
public class Pageeditfaqmodify implements  PageeditService {
	
	
	


	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {

		HashMap<String, Object> orimap = (HashMap) obj;		
		ServiceFullDTO sfDTO= (ServiceFullDTO)orimap.get("sfDTO");
		ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
		
		HashMap<String, Object> res = new HashMap<>();
		res.put("sfDTO", db.detailfaq(sfDTO));
		res.put("npDTO", npDTO);
		
		return res;
	}

}
