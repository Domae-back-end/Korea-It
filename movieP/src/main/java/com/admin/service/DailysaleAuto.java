package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;

@Service
public class DailysaleAuto {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	DbMapper db;

	public void dailysaleDo() {
		// Date calcdate = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateForm2 = new SimpleDateFormat("yyyy-MM-01");
		// 일일체크
		String day = dateForm.format(cal.getTime());
		cal.add(Calendar.DATE, -1);// 어제의 것을.
		day = dateForm.format(cal.getTime());
		// 월체크
		String firstday = dateForm2.format(cal.getTime());

		SalesDTO salesDTO = new SalesDTO();
		salesDTO.setDaysaletime(day);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("day", day);//이날의 것을 뽑아온다.

	
		
		HashMap<String, SalesDTO> dayres = new HashMap<>();
		HashSet<String> sectors= new HashSet<String>();// 섹터들 담김.
		sectors.add("total");
		// dayres 맵 에는 독특하게 total 존재.
		if (db.getyesterdaysalesdistinct(map).size() > 0) {
			logger.info("월정산가게될날짜firstday" + firstday);
			logger.info("검색해서 뽑아올 날짜day:" + day);
			logger.info("몇개 오냐" + db.getyesterdaysalesdistinct(map).size());
			for (SalesDTO ss : db.getyesterdaysalesdistinct(map)) {
			sectors.add(ss.getSectorNo());	
			logger.info(ss.getSectorNo());
			}
		}// 해시셋에  중복되지 않는 관 이름만 찾아오기.
		Iterator<String> sectorlist= sectors.iterator();
		Iterator sectorlist2= sectors.iterator();
		while(sectorlist.hasNext()) {// sectors 가진 값 확인.
			System.out.println(sectorlist.next()); //넥스트 함부로 쓰지말길.
		}
		
		sectorlist= sectors.iterator();// total 값 추가된 새로운 iterator.
		while(sectorlist.hasNext()) {
			dayres.put(sectorlist.next()+"",new SalesDTO());//맵에 각 키별로 salesDTO생성.
		}
		// 초기화된 total집어넣기.
		dayres.put("total", new SalesDTO());
		SalesDTO daytotal= dayres.get("total");
		daytotal.setSectorNo("total");
		daytotal.setTotalsale(0);
		daytotal.setTotalrefund(0);
		daytotal.setSumall(0);//
		dayres.put("total", daytotal);//완성본으로 갈아끼우기.
		// db insert작업.
		if(day.split("-")[2].equals("01")) {// 첫날이면딱 한번 돌아감. equals 01
			sectorlist= sectors.iterator();//마지막 한바퀴 돌 이터레이터 재소환
			sectorlist2= sectors.iterator();
			while(sectorlist.hasNext()) {
				SalesDTO forfirstday = new SalesDTO();
				forfirstday.setFirstday(day);
				forfirstday.setSectorNo(sectorlist.next());
				System.out.println("2일새벽에 insert 한다."+forfirstday.getSectorNo());
				db.insertmonthsales(forfirstday);
			}
		}
		
		sectorlist= sectors.iterator();
		while(sectorlist.hasNext()) {
			dayres.get(sectorlist.next()).setSectorNo((String)sectorlist2.next());;
		
		}
		if (db.getyesterdaysales(map).size() > 0) {
			System.out.println("찐갯수:"+db.getyesterdaysales(map).size() );
			for (SalesDTO ss : db.getyesterdaysales(map)) {// 어제의 세일즈들을 다 뽑아온다.
				logger.info("db에서 잡아온애들:"+ss.getSalesprice());
				if(dayres.containsKey(ss.getSectorNo())) {
					SalesDTO ggg= (SalesDTO)dayres.get(ss.getSectorNo());
					if(ss.getSalesprice()>0)// +라면
					ggg.setTotalsale(ss.getSalesprice()+ggg.getTotalsale());
					if(ss.getSalesprice()<0)
					ggg.setTotalrefund(-ss.getSalesprice()+ggg.getTotalrefund());
					
					ggg.setSumall( ggg.getSumall() +ss.getSalesprice());// 환불이든 매출이든 + 해주면 sumall 순액은 그냥 계산됨.
					
					
					
					ggg.setFirstday(firstday);
					System.out.println(ggg.toString());
					
				}
				
			}
			
			
			
		}
		
		//월간 db에 삽입.
		if (db.getyesterdaysales(map).size() > 0) {
			for (SalesDTO ss : db.getyesterdaysales(map)) {
			sectors.add(ss.getSectorNo());				
			}
		}
		sectorlist= sectors.iterator();
		while(sectorlist.hasNext()) {// "total" 에 넣어줄 정보들.
			String name = sectorlist.next();
			daytotal.setTotalsale(daytotal.getTotalsale()+dayres.get(name).getTotalsale());
			daytotal.setTotalrefund(daytotal.getTotalrefund()+dayres.get(name).getTotalrefund());
			daytotal.setFirstday(firstday);
		}
		daytotal.setSumall(daytotal.getTotalsale()-daytotal.getTotalrefund());

		
		// 최종 db 업데이트
		
		sectorlist= sectors.iterator();//마지막 한바퀴 돌 이터레이터 재소환
		sectorlist2= sectors.iterator();
		while(sectorlist.hasNext()) {//3개 가져오기는 하느데 암것도 없음.
			logger.info(dayres.get(sectorlist.next()).toString());
			
		}
		//매일매일
	
		sectorlist= sectors.iterator();//마지막 한바퀴 돌 이터레이터 재소환
		sectorlist2= sectors.iterator();
		
		while(sectorlist.hasNext()) {
			db.updatemonthsales(dayres.get(sectorlist.next()));
		}
		
		
		
		

//		}
		System.out.println("끗");
	}

}
