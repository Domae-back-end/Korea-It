package com.user.service;

import java.time.chrono.MinguoDate;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MimgDTO;
import com.model.MovieAction;
import com.model.MovieAction6;
import com.model.MovieInfoDTO;


@Service
public class Movieimg implements MovieAction6{
	
	@Resource
	DbMapper mm;

	@Override
	public Object execute(Object m_index) {
		List<MimgDTO> res = mm.pullimg((Integer)m_index);
		return res;
	}
	

	
}
