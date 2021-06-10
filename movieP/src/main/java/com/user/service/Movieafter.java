package com.user.service;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieAction;
import com.model.MovieAction6;
import com.model.MovieInfoDTO;
import com.model.MovieRateDTO;


@Service
public class Movieafter implements MovieAction6{
	
	@Resource
	DbMapper mm;
	



	@Override
	public Object execute(Object str) {
		List<MovieInfoDTO> list = mm.movieInfoAfter((String)str);
		Iterator<MovieInfoDTO> it = list.iterator();
		while(it.hasNext()) {
			MovieInfoDTO aa = it.next();
			aa.setGpa(mm.calcGPA(aa.getM_index()));
			aa.setMlike(mm.selectlike(aa.getM_index()));
			aa.setMovietitle(mm.foundmoviename(aa.getM_index()));
			if(aa.getGpa() == null) {
				aa.setGpa(mm.calcGPA(0));
			}
		}
		
	
		
		
		//3일 동안 예메된 영화의 전체 좌석수를 가져오기(분모) -- >ticketing 태이블에서 time_index 가져와서 movietime에서 sectorNo가져와서 비교하기
		//각 영화의 예매된 좌석수를 가져온다(분자) --> time_index 이용하여 movietitle 가져와 저장하고 해당 time_index의 예매된 좌석의 수와 title 일치시키기.
		List<MovieRateDTO> mrd = mm.pulltime_index();
		HashMap<String, Integer> rate = new HashMap<String, Integer>();
		//3일내의 예매된 티켓들의 time_index만 가져옴
		
		//분모구하기
		Integer totalSeat =0;
		//분모구하기
		//현재 mrd에는 중복된 time_index가 들어있음.
		HashSet<MovieRateDTO> hs = new HashSet<MovieRateDTO>(mrd);
		Iterator<MovieRateDTO> it2 = hs.iterator();
		while(it2.hasNext()) {
			MovieRateDTO dd = it2.next();
			String sec = mm.FoundSector(dd.getTime_index());
			if(sec.contains("작은관")) {
				totalSeat += 100;
			}
			else {
				totalSeat += 200;
			}
		}
		
		for(String mapkey : rate.keySet()) {
			//mapkey == 키
			int ticketingSeat =0;
			ticketingSeat += rate.get(mapkey);

		}
		
		//각 영화의 분자구하기
		Iterator<MovieRateDTO> ii = mrd.iterator();
		while(ii.hasNext()) {
			MovieRateDTO s1 = ii.next();
			s1.setMovietitle(mm.FoundMovietitle(s1.getTime_index()));
			System.out.println("$#$@$@$@"+s1);
			if(!rate.containsKey(s1.getMovietitle())) {
				//만약 해당 영화의 키가 없다면
				rate.put(s1.getMovietitle(), 1);
			}
			else {
				//해당 영화의 키가 있다면
				int cnt = rate.get(s1.getMovietitle()) +1;
				rate.replace(s1.getMovietitle(), cnt);
			}
		}
		

		
		Iterator<MovieInfoDTO> it3 = list.iterator();
		while(it3.hasNext()) {
			MovieInfoDTO dd = it3.next();
			if(rate.get(dd.getMovietitle()) != null) {
				//System.out.println("&&&&&&&&&&&&&&&&&&&&&&"+rate.get(dd.getMovietitle()) / totalSeat);
				 double k = Math.round( ((double)rate.get(dd.getMovietitle()) / totalSeat)*100)/100.0;
				dd.setRes_rate(k);
			}else {
				dd.setRes_rate(0.0);
			}
			//System.out.println("제목: "+dd.getMovietitle() + "예매율: "+dd.getRes_rate());
		}


		
		//계산된 평점은 해당 movieinfo의 res_rate에 저장.
		//MovieInfoDTO의 res_Rate로 따진다.
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
