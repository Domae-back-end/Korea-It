package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberjoinReg implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto) {
		
		MemberDTO dto = new MemberDTO();
		
		dto.setUserid(mdto.getUserid());
		dto.setUsername(mdto.getUsername());
		dto.setUserpnum(mdto.getUserpnum());
		dto.setUseremail(mdto.getUseremail());
		dto.setUserbirth(mdto.getBirthDay(), mdto.getBirthYear());
		dto.setUserpw(mdto.getUserpw());

		//dm.memjoin(dto);
	
		return null;
	}
	
}
