package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class Membermodify implements MemberAction{

	@Resource
	DbMapper dm;

	@Override
	public Object execute(MemberDTO mdto, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("cnt", dm.memModify(mdto));
		
		System.out.println(map);
		return map;
	}
	//
	
}
