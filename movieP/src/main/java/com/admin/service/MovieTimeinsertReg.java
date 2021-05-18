package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimeinsertReg")
public class MovieTimeinsertReg implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {

		AlterDTO al = new AlterDTO();
		System.out.println(dto.getMovietitle());
		System.out.println(dto.getStarttime1());
		if (dto.getMovietitle().equals("") || dto.getMovietitle() == null) {
			al.setMsg("영화를 선택하지 않았습니다.");
			al.setUrl("/admin/movietime/list?dal=" + dal + "&el=" + el);
		} else if (dto.getStarttime1().equals("") || dto.getStarttime1() == null) {
			al.setMsg("영화 상영 시간을 선택하지 않았습니다.");
			al.setUrl("/admin/movietime/list?dal=" + dal + "&el=" + el);
		} else {
			Calendar now = Calendar.getInstance();
			Date date = new Date();
			MovieInfoDTO mdto = db.findMovie(dto.getMovietitle());
			now.set(Calendar.MONTH, (Integer.parseInt(dal))-1);
			now.set(Calendar.DATE, Integer.parseInt(el));
			date= now.getTime();
			dto.setReg_date(date);
			
			now.set(Calendar.HOUR, Integer.parseInt(dto.getStarttime1().split(":")[0]));
			now.set(Calendar.MINUTE, Integer.parseInt(dto.getStarttime1().split(":")[1]));
			date= now.getTime();
			dto.setStarttime(date);
			now.add(Calendar.MINUTE, mdto.getMplaytime());
			date= now.getTime();
			dto.setEndtime(date);
			db.insertMovieTime(dto);
			al.setMsg("성공적으로 시간표가 추가되었습니다.");
			al.setUrl("/admin/movietime/list?dal=" + dal + "&el=" + el);
		}

		return al;
	}
}
