package com.user.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.InfoDTO;
import com.model.MovieAction6;
import com.model.MovieReviewDTO;

@Service
public class Myreview implements MovieAction6{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object info) {

		InfoDTO Info = (InfoDTO) info;
		MovieReviewDTO dto = mm.myReview(Info);
		if(dto == null) {
			return null;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월dd일 HH:mm:ss");
		dto.setPosttime_s(sdf.format(dto.getPosttime()));
		System.out.println("내 리뷰: "+dto);
		return dto;
	}
	
}
