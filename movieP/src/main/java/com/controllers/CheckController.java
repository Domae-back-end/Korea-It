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
	//중복체크 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/admin/movietime/check", method = RequestMethod.GET)
	public int timecheck(@RequestParam("time") String time, @RequestParam("movietitle") String movietitle,
			@RequestParam("dal") String dal,@RequestParam("el") String el) {
		List<MovieTimeDTO> ar = db.movieTimeCheck(movietitle);

		Calendar start = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat checksdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar buf = Calendar.getInstance();
		buf.set(Calendar.MONTH, Integer.parseInt(dal)-1);
		buf.set(Calendar.DATE, Integer.parseInt(el));
		for (MovieTimeDTO a : ar) {
			if(checksdf.format(a.getReg_date()).equals(checksdf.format(buf.getTime()))) {
				try {
					start.setTime(sdf.parse("1970-01-01 " + time + ":00"));
				} catch (Exception e) {
					System.out.println("날짜오류2");
				}
				System.out.println(sdf.format(start.getTime()));
				System.out.println(sdf.format(a.getStarttime()));
				System.out.println(sdf.format(a.getEndtime()));
				if (start.getTime().before(a.getEndtime()) && start.getTime().after(a.getStarttime())) {
					System.out.println("걸림");
					return 0;
				}
			}
		}
		return 1;
	}

}
