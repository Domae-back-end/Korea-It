package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.ServiceFullDTO;
@Service
public class PageeditfaqinsertReg implements PageeditService {
	
	

	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		System.out.println("pageeditfaqinsertReg");
		HashMap<String, Object> map = (HashMap) obj;		
		ServiceFullDTO sfDTO = (ServiceFullDTO) map.get("sfDTO");
		
		System.out.println(sfDTO);
		db.insertfaq(sfDTO);
		

		AlterDTO al = new AlterDTO();	
		al.setMsg("FAQ  인서트 성공");
		al.setUrl("/admin/pageedit/faqlist");
		
		return al;
	}

}
