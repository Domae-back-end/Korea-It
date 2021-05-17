package com.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieTimeDTO;

@Service(value = "MovieTimedeleteReg")
public class MovieTimedeleteReg implements MovieTimeService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(String dal, String el, MovieTimeDTO dto) {

		int delete = db.deletemovie(dto);

		AlterDTO at = new AlterDTO();
		at.setUrl("/admin/movietime/detail?movietitle=" + dto.getMovietitle());
		if (delete == 0) {
			at.setMsg("삭제에 실패하였습니다.");
		} else {
			at.setMsg("삭제에 성공하였습니다.");
		}
		return at;
	}
}
