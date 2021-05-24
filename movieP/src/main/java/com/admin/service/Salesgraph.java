package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;


@Service
public class Salesgraph implements SalesService {
	

	Logger logger = LoggerFactory.getLogger(getClass());
	
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
	
	
	
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	
	
	return 	null;
}

}
