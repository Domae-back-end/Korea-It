package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.BannerDTO;
import com.model.DbMapper;
import com.model.MovieTimeDTO;
import com.model.MovieInfoDTO;

//Service단
@Service
public class Pageeditbanner implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		
		ArrayList<BannerDTO> res= (ArrayList<BannerDTO>) db.selectBanner();
		
		System.out.println(res.size());
		
		
		
		return res;
	}

	
}
