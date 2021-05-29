package com.user.service;

import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

@Service("MovieTicketingfinish")
public class MovieTicketingfinish implements MovieTicketingService{
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto, UserSitDTO udto) {
		String[] buf = udto.getSeatNo().split(",");
		for (int i = 1; i < buf.length; i++) {
			db.insertSit(new UserSitDTO(udto.getM_index(),buf[i],udto.getUserid()));
		}
		HashMap<String, String> ar = new HashMap<>();
		ar.put("msg", "예매가 완료되었습니다.");
		ar.put("url", "/user/mainpage/main");
		return ar;
	}
}
