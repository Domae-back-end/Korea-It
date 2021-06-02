package com.user.service;

import java.text.SimpleDateFormat;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction6;
import com.model.MovieInfoDTO;


@Service
public class Moviedetail implements MovieAction6{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object index) {
		
		MovieInfoDTO res = mm.movieDetail((Integer)(index));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월dd일");
		String date = sdf.format(res.getMdate());
		res.setMdate_s(date);
		res.setMplot(res.getMplotBr()); 
		res.setGpa(mm.calcGPA(res.getM_index()));
		return res;
	}
	

	
}
