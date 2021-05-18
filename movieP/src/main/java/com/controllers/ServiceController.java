package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/serviceC/{service}")
public class ServiceController {

	
	@RequestMapping
	public String view(@PathVariable String service) { //일단 처음에 들어오면 무조건 index로가. index에서 include된 bodyurl만 밑에꺼로 포함되서 가져와

		return "user/index";
	}
	
	
	@ModelAttribute("bodyurl") 
	String bodygogo(@PathVariable String service) {
		
		return "serviceC/"+service; //메인
	}
	
	
}
