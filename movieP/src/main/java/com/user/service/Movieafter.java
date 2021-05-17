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
import com.model.MovieInfoDTO;


@Service
public class Movieafter implements MovieAction{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute() {
		System.out.println("Movielist execute()");
		List<MovieInfoDTO> list = mm.movieInfoAfter();
	
		return list;
	}
	

	
}
