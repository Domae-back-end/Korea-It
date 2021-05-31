package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.InitData;
import com.model.Menu;
import com.model.SalesDTO;
import com.model.SalesPageDTO;

@Controller("/admin/ticketadmin/{service}")
public class TicketAdminController {

	@Resource
	Provider pr;
	//

	@ModelAttribute("data")
	Object data(@PathVariable String service,HttpServletRequest request) {
		System.out.println("ticketadmin/"+service+"를 실행합니다:");
		SalesService sr = pr.getContext().getBean("ticketadmin"+service,SalesService.class);
		//일단 검색 가능하도록.
		
		Map<String, Object> obj= new HashMap<>();
		obj.put("request",request);
		
	
		
		return sr.execute(obj);//execute결과물 map으로해주면 ,jsp에서 알아서뽑아올수있음.
	}

	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "ticketadmin/"+service;
	}
	
	@ModelAttribute("submenu")// test ${submenu not null}
	ArrayList<Menu> subMenu( ) {
		return InitData.getSubmenusbyCateName("ticketadmin");
	}
	
	
	@RequestMapping
	String viewgo(@PathVariable String service) {
		if(service.contains("Reg")) {
			return "admin/page/alter";
		}
		
		return "admin/index";
	}
	
	
}
