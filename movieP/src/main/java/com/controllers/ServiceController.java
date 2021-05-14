package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/serviceC/{service}")
public class ServiceController {

	
	
	@RequestMapping
	public String view(@PathVariable String service) {
		
		return "user/page/serviceC/"+service;
	}
	
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "/"+service;
	}
}
