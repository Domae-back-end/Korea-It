package com.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimeinsert")
public class MovieTimeinsert implements MovieTimeService{
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {List<MovieTimeDTO> ar = db.movieTime();
	
//	for (MovieTimeDTO a : ar) {
//		if(dto.getStarttime().after(a.getStarttime()) || dto.getEndtime().before(dto.getEndtime())){
//			
//		}
//	}
//		
		return db.movieInfo();
	}
}
