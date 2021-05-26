package com.user.service;

import java.util.Optional;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MemberDTO;
import com.model.MemberNaverAction;

@Service
public class MembernaverLogin implements MemberNaverAction {

	@Resource
	DbMapper dm;
	
	@Override
	public Object execute(JSONObject response_obj) {
		
		String userid = (String) response_obj.get("id");
		String birthday = (String) response_obj.get("birthday");
		String birthYear = (String) response_obj.get("birthyear");
		String useremail = (String) response_obj.get("email");
		String userphone = (String) response_obj.get("mobile");
		String username = (String) response_obj.get("name");

		MemberDTO dto = new MemberDTO();
		
		dto.setUserid(userid);
		dto.setUsername(username);
		dto.setUserpnum(userphone);
		dto.setUseremail(useremail);
		dto.setUserbirth(birthday, birthYear);
		dto.setKind("네이버");
		
		Optional<MemberDTO> dtoo = Optional.ofNullable(dm.memlogin(dto));
		
		MemberDTO mdCh = dm.memlogin(dto);	
		
		if(mdCh==null) {
			dm.memjoin(dto);
		}
		return userid;
	}

}
