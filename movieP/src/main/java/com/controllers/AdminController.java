package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")// 관리자 메인페이지 
public class AdminController {

	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		return "movietime/movielist";
	}
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
