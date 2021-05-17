package com.admin.service;

import java.text.SimpleDateFormat;
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
		System.out.println(dto);

		return null;
	}
}
