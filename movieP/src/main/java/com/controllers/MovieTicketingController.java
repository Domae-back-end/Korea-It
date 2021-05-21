package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.PPPData;

@Controller
@RequestMapping("user/movietime/{cate}")
public class MovieTicketingController {
	
	@ModelAttribute
	PPPData pppData(@PathVariable("cate")String cate) {
		System.out.println("?");
		return new PPPData("movietime","movietime"+cate);
	}
	
	
	@RequestMapping
	String url() {
		return "/user/home";
	}
}
