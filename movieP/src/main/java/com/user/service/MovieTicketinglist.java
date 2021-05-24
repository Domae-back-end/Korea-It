package com.user.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;

@Service("MovieTicketinglist")
public class MovieTicketinglist implements MovieTicketingService {
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String msg) {
		HashMap<String, Object> ar = new HashMap<>();
		System.out.println(db.movielist());
		ar.put("movielist", db.movielist());
		
		return ar;
	}
}
