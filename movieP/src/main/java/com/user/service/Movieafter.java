package com.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction3;
import com.model.MovieInfoDTO;


@Service
public class Movieafter implements MovieAction3{
	
	@Resource
	DbMapper mm;
	

	@Override
	public Object execute(String str) {
		List<MovieInfoDTO> list = mm.movieInfoAfter(str);
		Iterator<MovieInfoDTO> it = list.iterator();
		while(it.hasNext()) {
			MovieInfoDTO aa = it.next();
			aa.setMlike(mm.selectlike(aa.getM_index()));
		}
		return list;
	}
	

	
}
