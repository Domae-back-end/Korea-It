package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.Menu;


@Controller
@RequestMapping("admin/pageedit/{service}")
public class PageeditController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service) {
		System.out.println("pageedit-"+service+"실행");
		PageeditService sr = pr.getContext().getBean("pageedit"+service,PageeditService.class);
		Object obj= new Object();
		return sr.execute(obj);
	}
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "pageedit/"+service;
	}
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		System.out.println("서브메뉴들어간다.");
		HashMap<String, ArrayList<Menu>>map = new HashMap<>();
		
		map.put("info2", new ArrayList<Menu>());
		map.put("product2", new ArrayList<Menu>());
		map.put("center", new ArrayList<Menu>());
		map.put("sales", new ArrayList<Menu>());
		map.put("pageedit", new ArrayList<Menu>());
		
		map.get("pageedit").add(new Menu("banner","메인베너관리"));
		map.get("pageedit").add(new Menu("noticelist","공지사항/뉴스"));
		map.get("pageedit").add(new Menu("movieinfolist","영화정보관리"));
		
		map.get("sales").add(new Menu("main","매출보기"));
		map.get("sales").add(new Menu("","추가가능"));
		map.get("sales").add(new Menu("","추가가능"));
		
		map.get("product2").add(new Menu("tv","TV"));
		map.get("product2").add(new Menu("phone","핸드폰"));
		
		map.get("center").add(new Menu("notice","공지사항"));
		map.get("center").add(new Menu("qna","질문및답변"));
		map.get("center").add(new Menu("fnq","자주찾는질문"));
		
		return map.get("pageedit");
	}
	
	
	@RequestMapping
	String mainpage() {
		return "admin/index";
	}
	
}
