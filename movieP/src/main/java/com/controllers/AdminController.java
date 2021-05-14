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
		return "main/mainpage";
	}

	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		System.out.println("메인페이지라 서브메뉴없음..");
		
		
		return null;
	}
	
	@RequestMapping
	String mainpage() {
		return "admin/index";//. jsp
	}
	
}
