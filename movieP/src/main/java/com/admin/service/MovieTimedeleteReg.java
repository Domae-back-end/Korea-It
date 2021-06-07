package com.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Controller("MovieTimedeleteReg")
public class MovieTimedeleteReg implements MovieTimeService{
	

	@Resource
	DbMapper db;
	
	
	@Override
	public Object execute(MovieTimeDTO dto) {
		AlterDTO adto = new AlterDTO();
		adto.setMsg("삭제가 완료되었습니다.");
		adto.setUrl("/admin/movietime/list?dal="+dto.getDal()+"&el="+dto.getEl());

		String[] deletetime = dto.getDeletetime().split(",");
		for (String a : deletetime) {
			db.deletemovie(Integer.parseInt(a));
		}
		return adto;
	}
}
