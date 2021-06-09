package com.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.UserSitDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

@Service("MovieTicketinglistReg")
public class MovieTicketinglistReg implements MovieTicketingService {

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto,UserSitDTO udto) {
		HashMap<String, Object> ar = new HashMap<>();
		ar.put("sit", db.moviesit(dto.getTime_index()));
		ar.put("no", dto.getSectorno());
		
		if( udto.getCnt1() != null || udto.getCnt2() != null || udto.getCnt3() !=null) {
			int c = 2000;
			int t = 5000;
			int a = 10000;
			int total = udto.getCnt1() * c + udto.getCnt2() * t + udto.getCnt3() * a;
			ar.put("money", total);
		}
		
		ArrayList<UserSitDTO> ac = (ArrayList<UserSitDTO>) db.moviesitfind(dto.getTime_index());
		
		//중복
		if(udto.getSeatNo() != null) {
			String[] buf = udto.getSeatNo().split(",");
			for (int i = 1; i < buf.length; i++) {
				ac.add(new UserSitDTO(buf[i]));
			}
		}
		System.out.println(ac);
		ar.put("sitting", ac);
		
		return ar;
	}
	
}
