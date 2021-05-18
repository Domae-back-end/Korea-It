package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.Menu;


@Controller
@RequestMapping("admin/sales/{service}")

public class SalesController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service) {
		System.out.println(service+"를 실행합니다:");
		SalesService sr = pr.getContext().getBean("sales"+service,SalesService.class);
		//일단 검색 가능하도록.
		
		Object obj= new Object();
		return sr.execute(obj);//execute결과물 map으로해주면 ,jsp에서 알아서뽑아올수있음.
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "sales/"+service;
	}
	
	
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		HashMap<String, ArrayList<Menu>>map = new HashMap<>();
		
		map.put("sales", new ArrayList<Menu>());
		map.get("sales").add(new Menu("main","매출보기"));
		map.get("sales").add(new Menu("graph","그래프로조회"));
		map.get("sales").add(new Menu("","추가가능"));
		
		return map.get("sales");
	}
	
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
