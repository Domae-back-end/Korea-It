package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.PPPData;

@Controller
@RequestMapping("/user/mainpage/{service}")
public class PPP {
	
	@Resource
	Provider pr;
	
	@ModelAttribute
	PPPData pppData(@PathVariable String service) {
		return new PPPData("mainpage", service);
	}
	
	@RequestMapping
	String view() {
		return "user/page/index";
	}
}
