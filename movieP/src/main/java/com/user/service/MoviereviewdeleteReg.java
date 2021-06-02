package com.user.service;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieAction6;
import com.model.MovieReviewDTO;

@Service
public class MoviereviewdeleteReg implements MovieAction6{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object dto1) {
		//System.out.println("MovieReviewdeleteReg 서비스빈. 영화번호"+dto.getCate());
		MovieReviewDTO dto = (MovieReviewDTO)dto1;
		
		AlterDTO alt = new AlterDTO();
		alt.setMsg(dto.getUserid()+"님 관람평 삭제 완료.");
		alt.setUrl( "moviedetail?sub=review&ind="+dto.getCate());
		if(dto.getUserid()==null) {
			alt.setMsg("로그인이 필요한 기능입니다.");
			alt.setUrl("/member/login/loginForm");
			return alt;
		}
		
		Integer ss = mm.reviewdelete(dto);
		if(ss == 0) {
			alt.setMsg("삭제 실패");
		}
		
		return alt;
	}
	
}
