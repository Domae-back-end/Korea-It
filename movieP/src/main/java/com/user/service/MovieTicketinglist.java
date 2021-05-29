package com.user.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

@Service("MovieTicketinglist")
public class MovieTicketinglist implements MovieTicketingService {
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto,UserSitDTO udto) {
		HashMap<String, Object> ar = new HashMap<>();
		ar.put("movielist", db.movielist());
		List<MovieTimeDTO> tot = new ArrayList<MovieTimeDTO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(dto.getDal() != null && dto.getEl() != null) {
			List<MovieTimeDTO> timelist = db.findMovieTime(dto.getMovietitle());
			for (MovieTimeDTO a : timelist) {
				Date dbday = a.getReg_date();
				Calendar today = Calendar.getInstance();
				today.set(Calendar.MONTH, Integer.parseInt(dto.getDal())-1);
				today.set(Calendar.DATE, Integer.parseInt(dto.getEl()));
				if(sdf.format(dbday).equals(sdf.format(today.getTime()))) {
					tot.add(a);
				}
				
			}
			ar.put("movietimelist", tot);
		}
		return ar;
	}
}
