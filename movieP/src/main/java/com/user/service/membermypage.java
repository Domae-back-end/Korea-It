package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class membermypage implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto, HttpSession session) {
		
		String userid = (String) session.getAttribute("sessionId");
		mdto.setUserid(userid);

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("dto", dm.memlogin(mdto));
		map.put("purchase", dm.mempurchase(mdto));
		map.put("comment", dm.memcomment(mdto));
		map.put("like", dm.memlikeinfor(mdto));
		map.put("fna", dm.memfna(mdto));
		
		return map;
	}

}
