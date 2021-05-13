package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieService;
import com.admin.service.MovieTimeService;
import com.admin.service.Provider;

@Controller
@RequestMapping("admin/homepagecontrol/{service}")

public class PageController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service) {
		MovieService sr = pr.getContext().getBean("MovieTime"+service,MovieService.class);
		return sr.execute();
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		
		return "pagecontrol/"+service;
	}
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
