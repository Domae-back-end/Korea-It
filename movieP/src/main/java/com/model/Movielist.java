package com.model;

import java.util.Iterator;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


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
