package com.model;

import java.util.Iterator;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service
public class Movielist implements MovieAction{
	
	@Resource
	MovieMapper mm;
	
	@Override
	public Object execute() {
		System.out.println("Movielist execute()");
		List<MovieDTO> list = mm.movielist();
//		Iterator it = list.iterator();
//		while(it.hasNext()) {
//			MovieDTO dd = (MovieDTO)it.next();
//			System.out.println(dd.getMovietitle());
//		}
		return list;
	}
	
}
