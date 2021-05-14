package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;
import com.model.MovieInfoDTO;

//Service단
@Service
public class Pageeditbanner implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
//		List<MovieTimeDTO> dto1 = db.movieTime();
//		List<MovieTimeDTO> res = new ArrayList<MovieTimeDTO>();
//		for (MovieTimeDTO a : dto1) {
//			if(((a.getReg_date().getMonth()+1)+"").equals(dal) &&
//					(a.getReg_date().getDate()+"").equals(el)) {
//				res.add(a); 
//			}
//		}
		return "배너";
	}

	
}
