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

@Service(value = "MovieTimeupdateReg")
public class MovieTimeupdateReg implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {
		
		ArrayList<MovieTimeDTO> list = dto.getList();
		MovieInfoDTO mdto = db.findMovie(dto.getMovietitle());
		
		ArrayList<Integer> ar = new ArrayList<>();
		
		for (int i = 0; i < list.size(); i++) {	
			Calendar now = Calendar.getInstance();
			Date date = new Date();
			now.setTime(list.get(i).getStarttime());
			now.add(Calendar.HOUR, mdto.getMplaytime());
			date= now.getTime();
			list.get(i).setEndtime(date);
			
			list.get(i).setMovietitle(dto.getMovietitle());
			int a = db.updatemovielist(list.get(i));
			ar.add(a);
		}
		
		AlterDTO adt = new AlterDTO();
		if(ar.contains(0)) {
			adt.setMsg("수정에 실패하였습니다.");
			adt.setUrl("/admin/movietime/update?movietitle="+dto.getMovietitle());
		}else {
			adt.setMsg("수정이 완료되었습니다.");
			adt.setUrl("/admin/movietime/detail?movietitle="+dto.getMovietitle());
		}
		
		return adt;
	}
}
