package com.user.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.ActorDTO;
import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction6;
import com.model.MovieInfoDTO;


@Service
public class Movieactor implements MovieAction6{
	
	@Resource
	DbMapper mm;
	

	@Override
	public Object execute(Object index) {
		List<ActorDTO> res = mm.pullactor((Integer)index);
		return res;
	}
	

	
}
