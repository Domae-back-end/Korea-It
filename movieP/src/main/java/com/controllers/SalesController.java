package com.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.InitData;
import com.model.Menu;
import com.model.PPPData;
import com.model.SalesDTO;
import com.model.SalesPageDTO;


@Controller
@RequestMapping("admin/sales/{service}")

public class SalesController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service, SalesDTO sadto,SalesPageDTO pdto,HttpServletRequest request) {
		System.out.println("sales/"+service+"를 실행합니다:");
		SalesService sr = pr.getContext().getBean("sales"+service,SalesService.class);
		//일단 검색 가능하도록.
		
		Map<String, Object> obj= new HashMap<>();
		obj.put("request",request);
		obj.put("sadto", sadto);
		obj.put("pdto", pdto);
	
		
		return sr.execute(obj);//execute결과물 map으로해주면 ,jsp에서 알아서뽑아올수있음.
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "sales/"+service;
	}
	
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		return InitData.getSubmenusbyCateName("sales");
	}
	@ModelAttribute("ppp")
	PPPData servicename(@PathVariable String service ) {
		PPPData aa= new PPPData();
		aa.setService(service);
		return aa;
	}	
	
	@ModelAttribute("nowday")
	String gotoday( ) {
		SimpleDateFormat sdf= new SimpleDateFormat("MM월 dd일");
		Date today = new Date();
		today.setDate(today.getDate()-1);
		
		
		
		return sdf.format(today);
	}
	
	@RequestMapping
	String viewgo(@PathVariable String service) {
		if(service.contains("Reg")) {
			return "admin/page/alter";
		}
		
		return "admin/index";
	}
	
}
