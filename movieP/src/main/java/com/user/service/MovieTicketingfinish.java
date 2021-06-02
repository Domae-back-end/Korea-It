package com.user.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieInfoDTO;
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

		int c = 2000;
		int t = 5000;
		int a = 10000;
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
		
		Date dateset = new Date();
		SimpleDateFormat sdf= new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		System.out.println("여기맞냐 .\n\n\n\n\n\n");
		for (int i = 1; i < buf.length; i++) {
			db.insertSit(new UserSitDTO(udto.getTime_index(),buf[i],udto.getUserid(),udto.getPeople(), sdf.format(dateset)));
		}
		
		UserSitDTO usdto= new UserSitDTO();
		// 아이디  박아주기 요망 from request.getsession()
		usdto.setReg_time(sdf.format(dateset));
		System.out.println(sdf.format(dateset));
		db.salesindexlink(usdto);
		
		//결제
		SalesDTO data = new SalesDTO();
		data.setTimetableidx(udto.getTime_index());
		MovieTimeDTO mbuf = db.movietimefindindex(udto.getTime_index());
		MovieInfoDTO ibuf = db.findMovie(mbuf.getMovietitle());
		data.setSectorNo(mbuf.getSectorno());
		data.setSalesprice(udto.getCnt1() * c + udto.getCnt2() * t + udto.getCnt3() * a);
		data.setPeople(people);
		data.setMovietitle(mbuf.getMovietitle());
		data.setUserid(udto.getUserid());
		if(udto.getChoice() == 1) {
			data.setSales_type("카드");
		}else {
			data.setSales_type("현금");
		}
		data.setSales_time(dateset);
		data.setM_index(ibuf.getM_index());
		
		db.insertSales(data);
		
		HashMap<String, String> ar = new HashMap<>();
		ar.put("msg", "예매가 완료되었습니다.");
		ar.put("url", "/user/mainpage/main");
		return ar;
	}
}
