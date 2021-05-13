package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;

@Controller
@RequestMapping("admin/movietime/{cate}")

public class MovieTimeController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String cate) {
		MovieTimeService sr = pr.getContext().getBean("MovieTime"+cate,MovieTimeService.class);
		return sr.execute();
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String cate) {
		return "movietime/"+cate;
	}
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
