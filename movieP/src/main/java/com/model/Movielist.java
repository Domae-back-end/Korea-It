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
//<<<<<<< HEAD
		List<MovieInfoDTO> list = mm.movielist();
//		Iterator it = list.iterator();
//		while(it.hasNext()) {
//			MovieDTO dd = (MovieDTO)it.next();
//			System.out.println(dd.getMovietitle());
//		}
//=======
//		List<MovieInfoDTO> list = mm.movieInfo();
//>>>>>>> branch 'master' of https://github.com/Final-Project12354/movieProj.git
		return list;
	}
	
}
