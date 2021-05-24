package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class PageeditnoticeinsertReg implements PageeditService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		System.out.println("빈 이름 PageeditnoticeinsertReg 소환됨");
		
		HashMap<String, Object> map= (HashMap)obj;
		ServiceFullDTO sfDTO = (ServiceFullDTO)map.get("sfDTO");
		
//		HttpServletRequest request = (HttpServletRequest)map.get("request");
//		//상상 .
//		HttpSession session = request.getSession();
//		// 가짜..
//		session.setAttribute("id", "bbb111");
//		
//		
//		//진짜.
//		persDTO.setPersid((String)session.getAttribute("id"));
//		persDTO.setPersimg(persDTO.getFile().getOriginalFilename());
//		
//		System.out.println("1:1문의등록내용:" +persDTO);
//		System.out.println("파일이름:"+persDTO.getFile().getOriginalFilename());
		
		
		//재료완성 > 재료 넣어서 메서드.
		
		
		
		
		db.insertNotice(sfDTO);

		AlterDTO ad = new  AlterDTO();
		
		ad.setMsg("공지등록 완료");
		ad.setUrl("/admin/pageedit/noticelist");
		
		return ad;
		
		
		//return null;
		
	}

	
}
