package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberloginReg implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto) {
	
		AlterDTO ad = new  AlterDTO();
		
		MemberDTO dd = dm.memlogin(mdto);
		
		ad.setMsg("로그인 실패. 아이디와 비밀번호를 확인해주세요.");
		ad.setUrl("loginForm");
		
		if(dd!=null) {
			
			ad.setMsg("로그인 되었습니다.");
			ad.setUrl("/user/main");
		}
		
		return ad;
	}
	
}
