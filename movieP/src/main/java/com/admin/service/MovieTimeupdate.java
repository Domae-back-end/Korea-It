package com.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Controller("MovieTimeupdate")
public class MovieTimeupdate implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(MovieTimeDTO dto) {
		HashMap<String, Object> ar = new HashMap<>();
		
		String[] deletetime = dto.getDeletetime().split(",");
		ArrayList<MovieTimeDTO> vf = new ArrayList<>();
		for (String a : deletetime) {
			vf.add(db.findMovieindex(Integer.parseInt(a)));
		}
		ar.put("movietimelist", vf);
		
		return ar;
	}

}
