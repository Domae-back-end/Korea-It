package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimeupdateReg")
public class MovieTimeupdateReg implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {
		
		ArrayList<MovieTimeDTO> list = dto.getList();
		MovieInfoDTO mdto = db.findMovie(dto.getMovietitle());
		for (int i = 0; i < list.size(); i++) {	
			Calendar now = Calendar.getInstance();
			Date date = new Date();
			now.setTime(list.get(i).getStarttime());
			now.add(Calendar.HOUR, mdto.getMplaytime());
			date= now.getTime();
			list.get(i).setEndtime(date);
			
			list.get(i).setMovietitle(dto.getMovietitle());
			
			db.updatemovielist(list.get(i));
		}
		
		return null;
	}
}
