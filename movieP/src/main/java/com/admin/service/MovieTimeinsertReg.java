package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

@Service("MovieTimeinsertReg")
public class MovieTimeinsertReg implements MovieTimeService{
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(MovieTimeDTO dto) {
		AlterDTO alter = new AlterDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm:00");

		alter.setMsg("등록됨");
		alter.setUrl("/admin/movietime/list?dal="+dto.getDal()+"&el="+dto.getEl());


		dto.setStarttime(dto.getTimeDate(dto.getTime()));
		MovieInfoDTO buf = db.findMovie(dto.getMovietitle());
		dto.setEndtime(dto.getEndTimeDate(buf.getMplaytime(), dto.getStarttime()));
		dto.setReg_date(dto.getRegDate(dto.getDal(), dto.getEl()));

		if(dto.getCheck().equals("false")) {
			db.insertMovieTime(dto);
		}else {
			
			
			if(dto.getDayto() == null || dto.getDayto().equals("") ||
					dto.getEndReg_date().equals("") || dto.getEndReg_date() == null) {
				alter.setMsg("입력하신 것들 중 입력 안한것이 있어 등록에 실패하였습니다.");
			}else {
				db.insertMovieTime(dto); //당일 등록은 필수.
				
				Calendar start = Calendar.getInstance();
				start.setTime(dto.getReg_date());
				
				Calendar finish = Calendar.getInstance(); //끝
				finish.setTime(dto.getEndRegDate(dto).getEndReg_date_re());
				
				
				String[] ar = dto.getDayto().split(",");
				
				
				while(true) {
					start.add(Calendar.DATE, 1);
					for (int i = 0; i < ar.length; i++) {
						if(start.get(Calendar.DAY_OF_WEEK) == Integer.parseInt(ar[i])) {
							dto.setReg_date(start.getTime());
							db.insertMovieTime(dto);
							System.out.println(sdf.format(dto.getReg_date()));
							break;
						}
					}
					if(sdf.format(start.getTime()).equals(sdf.format(finish.getTime()))){
						break;
					}
				}
			}
			
		}
		
		
		return alter;
	}
}
