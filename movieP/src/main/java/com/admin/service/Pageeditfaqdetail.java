package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
@Service
public class Pageeditfaqdetail implements  PageeditService {
	
	
	


	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {

		HashMap<String, Object> orimap = (HashMap) obj;		
		ServiceFullDTO sfDTO= (ServiceFullDTO)orimap.get("sfDTO");
		
		db.addcntfaq(sfDTO);
		
		return db.detailfaq(sfDTO);
	}

}
