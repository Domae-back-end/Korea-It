package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

@Service("MovieTicketinglistReg")
public class MovieTicketinglistReg implements MovieTicketingService {

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto,UserSitDTO udto) {
		HashMap<String, Object> ar = new HashMap<>();
		ar.put("sit", db.moviesit(dto.getTime_index()));
		ar.put("no", dto.getSectorno());
		return ar;
	}
	
}
