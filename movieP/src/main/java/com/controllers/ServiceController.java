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
	
	
	
	@ModelAttribute("bodyurl2")
	String bodypageUrl(@PathVariable String service) {
		
		//return "serviceHome"; //메인
		//return "serviceHistory"; //상담내역
		//return "serviceQna2"; //자주묻는질문
		//return "servicePersonal"; //1대1문의
		return "serviceNotice"; //공지사항
//		자주찾는서비스
	}
}
