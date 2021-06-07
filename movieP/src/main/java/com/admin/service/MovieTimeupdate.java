package com.admin.service;

import org.springframework.stereotype.Controller;

import com.model.MovieTimeDTO;

@Controller("MovieTimeupdate")
public class MovieTimeupdate implements MovieTimeService{
	
	@Override
	public Object execute(MovieTimeDTO dto) {
		return null;
	}
	
}
