package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Menu;

@Controller
@RequestMapping("admin")// 관리자 메인페이지 
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		//return "movietime/movielist";
		return "main/mainpage";
	}

	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		System.out.println("메인페이지");
		
		
		return null;
	}
	
//	@ModelAttribute("newqna") //1번째 div박스.
//	String newask( ) {
//		System.out.println("메인페이지");
//		
//		
//		return "새로운질문들3개";
//	}
	
	

	@ModelAttribute("adminmainpage_sales") // 2번째 div박스.
	String latestsales( ) {
		
		System.out.println("메인페이지");
		
		
		return "매출 들어갈 자리임";
	}
	
	
//	@ModelAttribute("hotfaq") //3번째 div박스.
//	String popularfaq( ) {
//		System.out.println("메인페이지");
//		
//		
//		return "조회수핫한자찾질3개";
//	}
		
	
//	@ModelAttribute("recentnotice") //4번째 div박스.
//	String hotnotice( ) {
//		System.out.println("메인페이지");
//		
//		
//		return "최근공지사항3개";
//	}
	
	
	
	
	@RequestMapping
	String mainpage(HttpServletRequest request) {
		
		HttpSession sess= request.getSession();
	
		//if(sess.getAttribute("adacDTO")!=null) {
			return "admin/index";
//		}
//		
//		else {
//			return "admin/loginpage";
//		}
		
		//return "admin/index";
		
		
	}
	
}
