package com.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MimgDTO;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieInfoDTO;


@Service
public class Moviecate implements MovieAction2{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Integer index) {
		List<CateDTO> res = mm.pullcate(index);
		return res;
	}
	

	
}
