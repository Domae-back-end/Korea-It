package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.ServiceFullDTO;
@Service
public class PageeditfaqmodifyReg implements PageeditService {
	
	

	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		System.out.println("pageeditfaqmodifyReg");
		HashMap<String, Object> map = (HashMap) obj;		
		ServiceFullDTO sfDTO = (ServiceFullDTO) map.get("sfDTO");
		
		int res = db.modifyfaq(sfDTO);

		AlterDTO al = new AlterDTO();	
		al.setMsg("FAQ  수정 성공");
		al.setUrl("/admin/pageedit/faqlist");
		
		return al;
	}

}
