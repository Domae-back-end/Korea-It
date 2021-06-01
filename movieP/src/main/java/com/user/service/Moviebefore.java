package com.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction3;
import com.model.MovieInfoDTO;


@Service
public class Moviebefore implements MovieAction3{
	
	@Resource
	DbMapper mm;
	

	@Override
	public Object execute(String str) {
		List<MovieInfoDTO> list = mm.movieInfoBefore(str);
		Iterator<MovieInfoDTO> it = list.iterator();
		while(it.hasNext()) {
			MovieInfoDTO aa = it.next();
			aa.setGpa(mm.calcGPA(aa.getM_index()));
			aa.setMlike(mm.selectlike(aa.getM_index()));
		}
		
		//전체 예매된 양을 가져오기
		Integer all = mm.allcount();
		//System.out.println("전체 개수: "+all);
		Iterator<MovieInfoDTO> it3 = list.iterator();
		while(it3.hasNext()) {
			MovieInfoDTO aa = it3.next();
			double k = (mm.detailCount(aa.getM_index())* 100 )/all;
			aa.setRes_rate(k);
			//System.out.println(mm.detailCount(aa.getM_index()));
			//System.out.println(aa.getMovietitle()+"의 현재 %: "+aa.getRes_rate());	
			
		
		}
		
		Collections.sort(list, new Comparator<MovieInfoDTO>() {
			@Override
			public int compare(MovieInfoDTO o1, MovieInfoDTO o2) {
				if(o1.getRes_rate() < o2.getRes_rate()) {
					return -1;
				}else if(o1.getRes_rate() > o2.getRes_rate()) {
					return 1;
				}else {
					return 0;
				}
				
			}
		});
		
		Collections.reverse(list);
		return list;
	}
	

	
}
