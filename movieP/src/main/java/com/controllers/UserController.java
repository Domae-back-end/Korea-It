package com.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


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
		return "body";
	}

}
