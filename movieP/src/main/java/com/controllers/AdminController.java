package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Menu;

@Controller
@RequestMapping("admin")// 관리자 메인페이지 
public class AdminController {

	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		//return "movietime/movielist";
		return "pageedit/banner";
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
		return "admin/index";//. jsp
	}
	
}
