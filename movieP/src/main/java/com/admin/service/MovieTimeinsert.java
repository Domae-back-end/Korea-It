package com.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimeinsert")
public class MovieTimeinsert implements MovieTimeService{
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {
		return db.movieInfo();
	}
}
