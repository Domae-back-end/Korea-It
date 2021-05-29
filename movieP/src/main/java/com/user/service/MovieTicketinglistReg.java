package com.user.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

@Service("MovieTicketinglistReg")
public class MovieTicketinglistReg implements MovieTicketingService {
	
	@Override
	public Object execute(MovieTimeDTO dto,UserSitDTO udto) {
		HashMap<String, Object> ar = new HashMap<>();
		return ar;
	}
	
}
