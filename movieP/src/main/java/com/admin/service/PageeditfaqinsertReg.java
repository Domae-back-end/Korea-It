package com.admin.service;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
@Service
public class PageeditfaqinsertReg implements PageeditService {

	@Override
	public Object execute(Object obj) {
		System.out.println("pageeditfaqinsertReg");
		
		

		

		AlterDTO al = new AlterDTO();	
		al.setMsg("FAQ  인서트 성공");
		al.setUrl("/admin/pageedit/faqlist");
		
		return al;
	}

}
