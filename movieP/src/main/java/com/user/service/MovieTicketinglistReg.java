package com.user.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;

@Service("MovieTicketinglistReg")
public class MovieTicketinglistReg implements MovieTicketingService {
	
	@Override
	public Object execute(MovieTimeDTO dto) {
		HashMap<String, Object> ar = new HashMap<>();
		System.out.println(dto);
		return ar;
	}
	
}
