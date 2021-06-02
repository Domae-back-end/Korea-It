package com.user.service;

import java.text.SimpleDateFormat;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction5;
import com.model.MovieInfoDTO;
import com.model.MovieReviewDTO;
import com.model.MoviepageDTO;
import com.model.ReviewListDTO;


@Service
public class Moviereview implements MovieAction5{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object rdto1, Object pdto1) {
		
		MovieReviewDTO rDTO = (MovieReviewDTO)rdto1;
		MoviepageDTO pdto = (MoviepageDTO)pdto1;
		
		System.out.println("전달되는 영화 코드: "+rDTO.getCate());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rDTO", rDTO);
		map.put("pDTO", pdto);
		pdto.init(mm, map);
		
		List<MovieReviewDTO> list = mm.review(map);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월dd일 HH:mm:ss");
		Iterator<MovieReviewDTO> it = list.iterator();
		while(it.hasNext()) {
			MovieReviewDTO mm = it.next();
			String date = sdf.format(mm.getPosttime());
			mm.setPosttime_s(date);
		}	
		 ReviewListDTO res = new ReviewListDTO();
		 res.setMrd(list);
		 res.setPdto(pdto);
		
		return res;
	}
	

	
}
