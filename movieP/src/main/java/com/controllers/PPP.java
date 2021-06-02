package com.controllers;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.BannerDTO;
import com.model.PPPData;
import com.user.service.BannerService;

@Controller
@RequestMapping("/user/mainpage/{service}")
public class PPP {
	
	@Resource
	Provider pr;
	
	@ModelAttribute
	PPPData pppData(@PathVariable String service) {
		return new PPPData("mainpage", service);
	}
	
	
	//
	
	

	@ModelAttribute("bannerimgs")
	Object bannerimgs(@PathVariable String service) {

		//bannergetmain
		BannerService scv =  pr.getContext().getBean( "bannerget"+service, BannerService.class);
		
		
		
		return  scv.execute() ;
	}
	
	
	
	
	
	
	
	@RequestMapping
	String view() {
		return "user/page/index";
	}
}
