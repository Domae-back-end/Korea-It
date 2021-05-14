package com.admin.service;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberjoinReg implements MemberAction {

	@Override
	public Object execute(MemberDTO mdto) {
		
		
		AlterDTO ad = new  AlterDTO();
		
		ad.setMsg("가입이 완료 되었습니다.");
		ad.setUrl("../../main");
		return ad;
	}
	
}
