package com.admin.service;

import org.springframework.stereotype.Service;

@Service(value = "MovieTimemain")
public class MovieTimemain implements MovieTimeService {
	
	@Override
	public Object execute() {
		return "이거 ><";
	}
	
}
