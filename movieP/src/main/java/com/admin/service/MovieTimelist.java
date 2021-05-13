package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

//Service단
@Service(value = "MovieTimelist")
public class MovieTimelist implements MovieTimeService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(String dal, String el) {
		List<MovieTimeDTO> dto = db.movieTime();
		List<MovieTimeDTO> res = new ArrayList<MovieTimeDTO>();
		for (MovieTimeDTO a : dto) {
			if(((a.getReg_date().getMonth()+1)+"").equals(dal) &&
					(a.getReg_date().getDate()+"").equals(el)) {
				res.add(a); 
			}
		}
		return res;
	}
	
}
