package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

//Service단
@Service
public class PageeditmovieinfoDelReg implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npDTO = (ServiceNoticePageDTO)orimap.get("npDTO");
		MovieInfoDTO mdto=  (MovieInfoDTO)orimap.get("mdto");
		HttpServletRequest request = (HttpServletRequest)orimap.get("request");
		
		
		
		String deleteNo = request.getParameter("deleteNo");
		
		String [] arr = request.getParameterValues("checkArr[]");
		System.out.println("삭제할 것: "+deleteNo);
		
		
		AlterDTO al = new AlterDTO();	
		al.setMsg("삭제 실패");
		
		int res = 0;
		int noId = 0;
		
		
		db.deleteMovieinfo(Integer.parseInt(deleteNo));
		al.setMsg("삭제 성공");
		
		System.out.println("결과: "+res);
		

		al.setUrl("/admin/pageedit/movieinfolist");

		return al;
	}

	
}
