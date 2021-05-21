package com.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.Provider;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@Controller
public class CheckController {

	@Resource
	DbMapper db;

	@ResponseBody
	@RequestMapping(value = "/admin/movietime/check", method = RequestMethod.GET)
	public int timecheck(@RequestParam("time") String time, @RequestParam("movietitle") String movietitle) {
		List<MovieTimeDTO> ar = db.movieTime();

		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int check = 1;

		MovieInfoDTO mdto = db.findMovie(movietitle);
		for (MovieTimeDTO a : ar) {
			try {
				start.setTime(sdf.parse("1970-01-01 " + time + ":00"));
				end.setTime(sdf.parse("1970-01-01 " + time + ":00"));
			} catch (Exception e) {
				System.out.println("날짜오류");
			}
			end.add(Calendar.MINUTE, mdto.getMplaytime());
			if (a.getStarttime().before(end.getTime()) && a.getStarttime().after(start.getTime())) {
				System.out.println("걸림");
				check = 0;
				break;
			}
		}
		return check;
	}

}
