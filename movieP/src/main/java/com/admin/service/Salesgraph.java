package com.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;


@Service
public class Salesgraph implements SalesService {
	

	

@Resource
DbMapper db;
	
@Override
public Object execute(Object obj) {
	// TODO Auto-generated method stub
	
	
	
	
	return 	db.getsales();
}

}
