package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimesearch")
public class MovieTimesearch implements MovieTimeService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
		if(dto.getTime_index() != null) {
			if(dto.getTime_index() == 3 || dto.getTime_index() == 4) {
				
			}else if(dto.getTime_index() == 2) {
				//날짜
			}
		}
		return db.movieTimefind(dto);
	}
}
