package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Admincoreservice;
import com.admin.service.Provider;
import com.model.Menu;

@Controller
@RequestMapping("admin")// 관리자 메인페이지 
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	Provider pr;
	
	@ModelAttribute("bodyurl")
	String bodypageUrl() {
		//return "movietime/movielist";
		return "main/mainpage";
	}

	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {// 관리자 메인페이지 
		System.out.println("메인페이지");
		
		
		return null;
	}
	

	
	
	
	
	
	
	
	
	
	@ModelAttribute("adminmainpage_sales") // 2번째 div박스.
	String latestsales( ) {
		
		System.out.println("메인페이지");
		
		
		return "매출 들어갈 자리임";
	}
	
	@ModelAttribute("data")
	HashMap<String, Object> mainpagedata( ) {
		System.out.println("메인페이지");
		HashMap<String, Object> nomeaning= new HashMap<String, Object>();
		Admincoreservice sr = pr.getContext().getBean("adminmainpageService",Admincoreservice.class);
		Object result = sr.execute(nomeaning);
		
		
		return sr.execute(nomeaning);
	}
	
	
	
	
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
