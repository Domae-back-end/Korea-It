package com.user.service;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieAction6;
import com.model.MovieReviewDTO;
import com.model.MovieReviewModDTO;

@Service
public class MoviereviewModifyReg implements MovieAction6{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object dto1) {
		//System.out.println("MovieReviewdeleteReg 서비스빈. 영화번호"+dto.getCate());
		MovieReviewModDTO rnd = (MovieReviewModDTO)dto1;
		
		AlterDTO alt = new AlterDTO();
		alt.setMsg(rnd.getUserid()+"님 관람평 수정 완료.");
		alt.setUrl( "moviedetail?sub=review&ind="+rnd.getCate());
		
		if(rnd.getUserid()==null) {
			alt.setMsg("로그인이 필요한 기능입니다.");
			alt.setUrl("/member/login/loginForm");
			return alt;
		}
		
		//관람평 수정시 해당 cnt값 업데이트하기.
		
		rnd.IntegerRating();
		Integer ss = mm.reviewmodify(rnd);
		if(ss == 0) {
			alt.setMsg("수정 실패");
		}
		
		return alt;
	}
	
}
