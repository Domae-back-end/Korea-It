package com.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("user/main")
public class UserController {

	@RequestMapping
	public String view(HttpServletRequest request, HttpSession session) {
		// /user 치면 메인페이지 
		System.out.println("usercontroller");
		
		session.setAttribute("sessionId", request.getParameter("userid") );
		
		return "user/index";
	}
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		return "body";
	}

}
