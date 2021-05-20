package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;
import com.model.ServiceNoticeDTO;

//Service단
@Service
public class Pageeditnoticeinsert implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
//		List<MovieTimeDTO> dto1 = db.movieTime();
//		List<MovieTimeDTO> res = new ArrayList<MovieTimeDTO>();
//		for (MovieTimeDTO a : dto1) {
//			if(((a.getReg_date().getMonth()+1)+"").equals(dal) &&
//					(a.getReg_date().getDate()+"").equals(el)) {
//				res.add(a); 
//			}
//		}
		//return "공지사항리스트";
		
		
		
		System.out.println("빈 이름 Pageeditnoticeinsert 소환됨");
		//service라는 이름의 키로 >  table 이름을 담는 클래스 dto? 
		
		
		//List<ServiceNoticeDTO> result = 
				
			//	db.insertNotice();
		
		//System.out.println("db갓"+result.size());
		
		return null;
	}
	
	
}
