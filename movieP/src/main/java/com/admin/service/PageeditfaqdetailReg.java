package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
@Service
public class PageeditfaqdetailReg implements PageeditService {
	
	

	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		System.out.println("pageeditfaqdetailReg");
		HashMap<String, Object> map = (HashMap) obj;		
		ServiceFullDTO sfDTO = (ServiceFullDTO) map.get("sfDTO");
		
		db.detailfaq(sfDTO);
		
		
		AlterDTO al = new AlterDTO();	
		al.setUrl("/admin/pageedit/faqdetail");
		
		return al;
	}

}
