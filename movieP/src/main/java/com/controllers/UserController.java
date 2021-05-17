package com.controllers;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MovieAction;

@Controller
@RequestMapping("user/main")
public class UserController {

	@RequestMapping
	public String view() {
		// /user 치면 메인페이지 
		System.out.println("usercontroller");
		return "user/index";
	}
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		return "inc/body";
	}

}
