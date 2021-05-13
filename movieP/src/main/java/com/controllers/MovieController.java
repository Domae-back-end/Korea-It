package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("movie")// 유저용 메인페이지 
public class MovieController {

	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		return "movietime/main";
	}
	
	@RequestMapping
	String mainpage() {
		return "movie/index";
	}
	
}
