package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service("MovieTimeinsert")
public class MovieTimeinsert implements MovieTimeService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto) {
		HashMap<String, Object> ar = new HashMap<>();
		ar.put("movielist", db.movielist());
		return ar;
	}
}
