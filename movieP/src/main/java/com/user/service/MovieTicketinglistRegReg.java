package com.user.service;

import org.springframework.stereotype.Service;

import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

@Service("MovieTicketinglistRegReg")
public class MovieTicketinglistRegReg implements MovieTicketingService {
	
	@Override
	public Object execute(MovieTimeDTO dto, UserSitDTO udto) {
		return null;
	}
	
}
