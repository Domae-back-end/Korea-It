package com.user.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class Membermypage implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto, HttpSession session) {
		
		String userid = (String) session.getAttribute("sessionId");
		mdto.setUserid(userid);
		
		HashMap<String, Object> pur = new HashMap<>();
		pur.put("mdto", mdto);
		pur.put("date", new SimpleDateFormat("yyyy-MM").format(new Date()));

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("dto", dm.memlogin(mdto));
		map.put("purchase", dm.mempurchase(pur));
		map.put("comment", dm.memcomment(mdto));
		map.put("like", dm.memlikeinfor(mdto));
		map.put("fna", dm.memfna(mdto));
		System.out.println(map.get("like"));
		return map;
	}

}
