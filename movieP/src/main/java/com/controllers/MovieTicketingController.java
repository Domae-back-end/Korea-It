package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.model.MovieTicketingService;
import com.model.MovieTimeDTO;
import com.model.PPPData;

@Controller
@RequestMapping("user/movietime/{cate}")
public class MovieTicketingController {

	@Resource
	Provider pr;

	@ModelAttribute("PPPData")
	PPPData pppData(@PathVariable("cate") String cate) {
		return new PPPData("movietime","movietime"+cate);
	}

	@ModelAttribute("data")
	Object data(@PathVariable String cate,MovieTimeDTO dto) {
		MovieTicketingService sr = pr.getContext().getBean("MovieTicketing" + cate, MovieTicketingService.class);
		return sr.execute(dto);
	}
	
	@RequestMapping
	String url() {
		return "user/page/index";
	}
}
