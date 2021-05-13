package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimedetail")
public class MovieTimedetail implements MovieTimeService{
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {
		HashMap<String, Object> ar = new HashMap<>();
		ar.put("info", db.findMovie(dto.getMovietitle()));
		ar.put("time", dto);
		return ar;
	}
}
