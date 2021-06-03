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
import com.model.MovieAction6;
import com.model.MovieInfoDTO;


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
			aa.setMlike(mm.selectlike(aa.getM_index()));
		}
		
		

		
		//3일 동안 개봉된 영화의 전체 좌석수를 가져오기(분모)
		//각 영화의 예매된 좌석수를 가져온다(분자)
		int cnt =0;
		Integer[] seatNum = new Integer[3];
		String[] seatName= {"작은관", "기존관", "3d"};
		for (String string : seatName) {
			seatNum[cnt] = mm.pullSeatNum(string);
			cnt++;
		}
		
		Integer totalSeat = seatNum[0]*100 + seatNum[1]*200 + seatNum[2]*200;
		//해당 영화의 예매된 좌석 갯수 가져오기
		//3일동안 해당영화의 예매된 자석 갯수 가져온다.

		//System.out.println("전체 개수: "+all);
		Iterator<MovieInfoDTO> it3 = list.iterator();
		while(it3.hasNext()) {
			MovieInfoDTO aa = it3.next();
			if(totalSeat !=0) {
				Integer retCnt = mm.allcount(aa.getM_index());
				Integer ticCnt = mm.detailCount(aa.getM_index());
				Integer realCnt = ticCnt - retCnt;

				System.out.println("실제 좌석 차지하는 수 : "+realCnt);
				double k = Math.round( ((double)realCnt / totalSeat)*100)/100.0;
				System.out.println("영화제목: "+aa.getMovietitle() + "예매율: "+k);
				aa.setRes_rate(k);
			}
			else {
				aa.setRes_rate(0.0);
			}
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
