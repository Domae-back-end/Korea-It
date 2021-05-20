package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.admin.service.FileupService;
import com.admin.service.MovieTimeService;
import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.BannerDTO;
import com.model.InitData;
import com.model.Menu;
import com.model.MinfoPageDTO;
import com.model.MovieInfoDTO;
import com.model.ServiceNoticeDTO;


@Controller
@RequestMapping("admin/pageedit/{service}") // member/  ddd
public class PageeditController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service,HttpServletRequest request, MovieInfoDTO mdto,
				MinfoPageDTO pdto,BannerDTO banDTO
				, ServiceNoticeDTO nDTO
			) {
		System.out.println("pageedit-"+service+"실행");
		System.out.println("Mdto:"+mdto);
		PageeditService sr = pr.getContext().getBean("pageedit"+service,PageeditService.class);		
	
		Map<String, Object> obj= new HashMap<String, Object>();
		obj.put("service", service);
		obj.put("mdto", mdto);
		obj.put("request", request);
		obj.put("pdto", pdto);
		obj.put("banDTO", banDTO);
		obj.put("nDTO", nDTO);
		
		return sr.execute(obj);	// has > servie,mdto,req, imgnames,pdto	
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "pageedit/"+service;
	}
	
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		return InitData.getSubmenusbyCateName("pageedit");
	}	
	@RequestMapping
	String view(@PathVariable String service) {	
		if(service.endsWith("Reg")) {
			return "admin/page/alter";
			}
	
		return "admin/index";
	}
	
}
