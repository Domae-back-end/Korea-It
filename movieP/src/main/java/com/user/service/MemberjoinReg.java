package com.user.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberAction;
import com.model.MemberDTO;

@Service
public class MemberjoinReg implements MemberAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(MemberDTO mdto, HttpSession session) {
		
		MemberDTO dto = new MemberDTO();
		
		dto.setUserid(mdto.getUserid());
		dto.setUsername(mdto.getUsername());
		dto.setUserpnum(mdto.getUserpnum());
		dto.setUseremail(mdto.getUseremail());
		dto.setUserbirth(mdto.getBirthDay(), mdto.getBirthYear());
		dto.setUserpw(mdto.getUserpw());
		dto.setKind(mdto.getKind());

		dm.memjoin(dto);
	
		return null;
	}
	
}
