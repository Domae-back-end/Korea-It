package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberCheck implements MemberAction {
	Logger logger =  LoggerFactory.getLogger(getClass());
	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto, HttpSession session) {
		
		HashMap<String, MemberDTO> map = new HashMap<>();
		logger.info(mdto.toString());
		map.put("dto", dm.memlogin(mdto));
		
		System.out.println(map);
		
		return map;
	}
}
