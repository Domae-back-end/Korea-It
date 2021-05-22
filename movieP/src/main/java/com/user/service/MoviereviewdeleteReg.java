package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieAction4;
import com.model.MovieReviewDTO;

@Service
public class MoviereviewdeleteReg implements MovieAction4{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(MovieReviewDTO dto) {
		System.out.println("MovieReviewdeleteReg 서비스빈. 영화번호"+dto.getCate());
		
		AlterDTO alt = new AlterDTO();
		alt.setMsg(dto.getUserid()+"님 관람평 삭제 완료.");
		alt.setUrl( "moviedetail?sub=review&ind="+dto.getCate());
		
		mm.reviewdelete(dto);
		
		return alt;
	}
	
}
