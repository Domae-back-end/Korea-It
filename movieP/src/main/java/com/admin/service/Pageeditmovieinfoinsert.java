package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MovieTimeDTO;

//Service단
@Service
public class Pageeditmovieinfoinsert implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		
		
		
		
		
		return "글쓰기화면";
	}
	
}
