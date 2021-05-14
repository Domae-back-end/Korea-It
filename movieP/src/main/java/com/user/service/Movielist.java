package com.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieInfoDTO;


@Service
public class Movielist implements MovieAction{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute() {
		System.out.println("Movielist execute()");
		List<MovieInfoDTO> list = mm.movieInfo();
		return list;
	}
	

	
}
