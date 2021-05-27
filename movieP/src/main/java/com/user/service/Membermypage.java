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
		
		if(session!=null) {
			String userid = (String) session.getAttribute("sessionId");
			mdto.setUserid(userid);
		}
		
		if(mdto.getDate()==null)
			mdto.setDate(new SimpleDateFormat("yyyy-MM").format(new Date()));
		
		if(mdto.getQnastate()==null)
			mdto.setQnastate("전체");

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("dto", dm.memlogin(mdto));
		map.put("purchase", dm.mempurchase(mdto));
		map.put("comment", dm.memcomment(mdto));
		map.put("like", dm.memlikeinfor(mdto));
		map.put("qna", dm.memqna(mdto));
		map.put("cnt", dm.memcount(mdto));
		
		System.out.println(map);
		
		return map;
	}

}
