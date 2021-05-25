package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.model.InitData;
import com.model.Menu;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Controller
@RequestMapping("admin/persqna/{service}")
public class PersqnaController {
	
	@Resource
	Provider pr;
	
	
	
	@ModelAttribute("data")
	Object data(@PathVariable String service, HttpServletRequest request
			,ServiceNoticePageDTO snpdto
			,ServiceFullDTO sfdto
			) {
		
		System.out.println("persqna-"+service+"실행");
		
		PageeditService sr = pr.getContext().getBean("persqna"+service,PageeditService.class);		
	
		
		Map<String, Object> obj= new HashMap<String, Object>();
		obj.put("request", request);
		obj.put("snpdto", snpdto);
		obj.put("sfdto", sfdto);
		
		return sr.execute(obj);
	}
	
	
	
	

	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "persqna/"+service;
		// 이러면 바디단에서 이 페이지를 열어준다 jsp??예스
	}
	
	
	
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		return InitData.getSubmenusbyCateName("persqna");
	}
	
	
	@RequestMapping
	String view(@PathVariable String service) {	
		if(service.endsWith("Reg")) {
			return "admin/page/alter";
		}

		return "admin/index";
	}
	
}
