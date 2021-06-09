package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
	public Object execute(MovieTimeDTO dto) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		HashMap<String, Object> ar = new HashMap<>();
		
		ar.put("today", new Date());
		
		if(dto.getDal() != null) {
			Calendar buf = Calendar.getInstance();
			buf.set(Calendar.MONTH, Integer.parseInt(dto.getDal())-1);	
			buf.set(Calendar.DAY_OF_MONTH, 1);
			ar.put("el2", buf.get(Calendar.DAY_OF_WEEK));
			ar.put("el3", buf.getActualMaximum(Calendar.DATE));
		}
		if(dto.getEl() != null) {
			Calendar buf = Calendar.getInstance();
			buf.set(Calendar.MONTH, Integer.parseInt(dto.getDal())-1);
			buf.set(Calendar.DATE, Integer.parseInt(dto.getEl()));
			ArrayList<MovieTimeDTO> ar1 = (ArrayList<MovieTimeDTO>) db.movieTimefind(sdf.format(buf.getTime()));
			
			for (MovieTimeDTO a : ar1) {
				System.out.println(a+","+a.getStarttimeInt()+","+a.getEndtimeInt());
			}
			
			
			ar.put("movietimelist", ar1);
			
		}
		if(dto.getDeletetime() != null) {
			if(!(dto.getDeletetime().contains(","))){
				ArrayList<MovieTimeDTO> ar2 = new ArrayList<>();
				ar2.add(db.findMovieindex(Integer.parseInt(dto.getDeletetime())));
				ar.put("deletetime", ar2);
			}else {
				String[] deletetime = dto.getDeletetime().split(",");
				ArrayList<MovieTimeDTO> ar2 = new ArrayList<>();
				for (int i = 0; i < deletetime.length; i++) {
					ar2.add(db.findMovieindex(Integer.parseInt(deletetime[i])));
				}
				ar.put("deletetime", ar2);
			}
		}
		
		return ar;
	}
	
}
