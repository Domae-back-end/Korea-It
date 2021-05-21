package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberCheck implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto) {
		
		HashMap<String, MemberDTO> map = new HashMap<>();
		
		map.put("dto", dm.memlogin(mdto));
		
		System.out.println(map);
		
		return map;
	}
}
