package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.model.BannerDTO;
import com.model.InitData;
import com.model.Menu;
import com.model.MinfoPageDTO;
import com.model.MovieInfoDTO;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Controller
@RequestMapping("admin/persqna/{service}")
public class PersqnaController {
	
	@Resource
	Provider pr;
	
	
	
	@ModelAttribute("data")
	Object data(@PathVariable String service,HttpServletRequest request
			,ServiceFullDTO sfdto
			) {
		
		System.out.println("persqna-"+service+"실행");
		
		PageeditService sr = pr.getContext().getBean("persqna"+service,PageeditService.class);		
	
		Map<String, Object> obj= new HashMap<String, Object>();
		obj.put("request", request);
		obj.put("sfdto", sfdto); // 얘말고 필수인 애들 다 넣으세요
		
		return sr.execute(obj);
	}
	
	
	
	
	
	
	
	
	
	

	@ModelAttribute("bodyurl")//두번째로 중요
	String bodypageUrl(@PathVariable String service) {
		//good
		return "persqna/"+service;
		// 이러면 바디단에서 이 페이지를 열어준다 jsp??예스
	}
	
	
	
	
	// 구석 ㄱ
	
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
