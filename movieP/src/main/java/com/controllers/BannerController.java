package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.model.BannerDTO;
import com.model.Menu;

@Controller//배너 AJAX 컨트롤러.
public class BannerController {

	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		//return "movietime/movielist";
		return "pageedit/"+"banner";
	}
	
	
	
	
	

	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {		
		System.out.println("배너컨트롤러 ㅎㅇ-서브메뉴들어간다");
		HashMap<String, ArrayList<Menu>>map = new HashMap<>();		
		map.put("pageedit", new ArrayList<Menu>());		
		map.get("pageedit").add(new Menu("banner","메인베너관리"));
		map.get("pageedit").add(new Menu("noticelist","공지사항/뉴스"));
		map.get("pageedit").add(new Menu("movieinfolist","영화정보관리"));
		
		return map.get("pageedit");
	}
	
	@RequestMapping(value="banner/change",method=RequestMethod.POST)
	@ResponseBody
	Map<String,String> bannerChange(BannerDTO bdto) {
		
		System.out.println("배너수정"+bdto);
		Map<String,String> result= new HashMap<>();
		/*
		 * String imgurl;
	int bannerindex;
	int delindex;	
	MultipartFile[] mfiles;
		 * */
		
		
		
		
		
		
		return result;
		
	}
	
	
	@RequestMapping
	String mainpage() {
		return "admin/index";//. jsp
	}
	
}
