package com.user.service;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
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
		List<MovieInfoDTO> list = mm.movieInfo();	

		
		
//		Collections.sort(list, new Comparator<MovieInfoDTO>() {
//			@Override
//			public int compare(MovieInfoDTO o1, MovieInfoDTO o2) {
//				if(o1.getRes_rate() < o2.getRes_rate()) {
//					return -1;
//				}else if(o1.getRes_rate() > o2.getRes_rate()) {
//					return 1;
//				}else {
//					return 0;
//				}
//				
//			}
//		});
		
//		Collections.reverse(list);
//		System.out.println("현재 예매율 순으로 정렬됐는지 확인\n");
//		Iterator<MovieInfoDTO> it2 = list.iterator();
//		while(it2.hasNext()) {
//			MovieInfoDTO aa = it2.next();
//			System.out.println(aa.getMovietitle()+"\n");
//		}
		
		
		
		return list;
	}	

	
}
