package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.admin.service.SalesService;

@Controller
@RequestMapping("admin/sales/{service}")

public class SalesController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service) {
		System.out.println("실행합니다:"+service);
		SalesService sr = pr.getContext().getBean("sales"+service,SalesService.class);
		Object obj= new Object();
		return sr.execute(obj);
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "sales/"+service;
	}
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
