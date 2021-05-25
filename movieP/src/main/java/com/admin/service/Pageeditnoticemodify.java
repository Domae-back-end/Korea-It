package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticeBNDTO;
import com.model.ServiceNoticePageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

//Service단
@Service
public class Pageeditnoticemodify implements PageeditService {
	

	@Resource
	DbMapper db;
	
	

	@Override
	public Object execute(Object obj) {//map
		
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npDTO=   (ServiceNoticePageDTO)orimap.get("npDTO");
		ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");

		
		
		
		
		ServiceNoticeBNDTO res = new ServiceNoticeBNDTO();
		res.setNow(db.noticedetail(sfDTO));
		res.setNpDTO(npDTO);
		
		
		return res;
	}
	
	
}
