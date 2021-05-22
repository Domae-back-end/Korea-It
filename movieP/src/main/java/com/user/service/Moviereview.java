package com.user.service;

import java.text.SimpleDateFormat;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieInfoDTO;
import com.model.MovieReviewDTO;


@Service
public class Moviereview implements MovieAction2{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Integer num) {
		System.out.println("리뷰 확인하기");
		List<MovieReviewDTO> list = mm.review(num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월dd일 HH:mm:ss");
		Iterator<MovieReviewDTO> it = list.iterator();
		while(it.hasNext()) {
			MovieReviewDTO mm = it.next();
			String date = sdf.format(mm.getPosttime());
			mm.setPosttime_s(date);
		}	
		
		return list;
	}
	

	
}
