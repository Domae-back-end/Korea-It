package com.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.SalesDTO;
import com.model.UserSitDTO;

@Service("MovieTicketingfinish")
public class MovieTicketingfinish implements MovieTicketingService{
	
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto, UserSitDTO udto) {
		String[] buf = udto.getSeatNo().split(",");
		//udto.time_index
		System.out.println(udto);
		//C -> 어린이
		//T -> 청소년
		//A -> 어른
		String people="";
		for (int i = 0; i < udto.getCnt1(); i++) {
			people+="C";
		}
		for (int i = 0; i < udto.getCnt2(); i++) {
			people+="T";
		}
		for (int i = 0; i < udto.getCnt3(); i++) {
			people+="A";
		}
		udto.setPeople(people);
		for (int i = 1; i < buf.length; i++) {
			db.insertSit(new UserSitDTO(udto.getTime_index(),buf[i],udto.getUserid(),udto.getPeople(), new Date()));
		}
		
		//결제
		SalesDTO data = new SalesDTO();
		
		
		
		HashMap<String, String> ar = new HashMap<>();
		ar.put("msg", "예매가 완료되었습니다.");
		ar.put("url", "/user/mainpage/main");
		return ar;
	}
}
