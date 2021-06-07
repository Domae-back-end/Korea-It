package com.user.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.BannerDTO;
import com.model.DbMapper;

@Service
public class Bannergetmain  implements BannerService{

	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	DbMapper db;
	
	
	
	@Override
	public Object execute() {

		
		
		ArrayList<BannerDTO> arr= db.getbannerimgs();
		
		System.out.println("arr siez:"+arr.size());
		for (BannerDTO bannerDTO : arr) {
			System.out.println(bannerDTO.getM_index());
		}
		
		return  arr ;
	}
	
	
	
	
	
	
	

}
