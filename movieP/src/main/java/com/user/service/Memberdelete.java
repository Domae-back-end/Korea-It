package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class Memberdelete implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto, HttpSession session, HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("dcnt", dm.memDelete(mdto));
		
		System.out.println(map);
		return map;
	}
}
