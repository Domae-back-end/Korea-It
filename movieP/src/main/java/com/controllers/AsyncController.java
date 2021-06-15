package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.TimeVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class AsyncController {
	@Resource
	Provider pr;




	

	@RequestMapping(value = "/salesTableSltView.do")
	@ResponseBody
	public Map<String, String> asynclogin(String id, String pw, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
																													// JSON.stringify(sample),
		
		Map<String, String> result = new HashMap<String, String>();
		return result;
		// 로그인 끝.

	}
	
	
	
	@RequestMapping(value = "/salesGraphSltView")
	@ResponseBody
	public Map<String, Object> salesGraphSltView(@RequestBody Map<String,String> map, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
		
		
		
		SalesService sr = pr.getContext().getBean("salesGraphSltView",SalesService.class);	
		//SalesGraphSltView , 
		
		return (LinkedHashMap<String, Object>)sr.execute(map);
	
	}

	 
	 
	 
	@RequestMapping(value = "/salesGraphRefunds")
	@ResponseBody
	public Map<String, Object> salesGraphRefunds(@RequestBody Map<String,String> map, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
		
		
		
		SalesService sr = pr.getContext().getBean("salesGraphRefunds",SalesService.class);	
		//SalesGraphSltView , 
		
		return (LinkedHashMap<String, Object>)sr.execute(map);
	
	}
	@RequestMapping(value = "/salesGraphSales")
	@ResponseBody
	public Map<String, Object> salesGraphSales(@RequestBody Map<String,String> map, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
		
		//
		
		SalesService sr = pr.getContext().getBean("salesGraphSales",SalesService.class);	
		//SalesGraphSltView , 
		
		return (LinkedHashMap<String, Object>)sr.execute(map);
	
	}
	
	
	///faqdetail.do
	@RequestMapping(value = "faqdetail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> faqdetail(@RequestBody Map<String,String> map, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
		
		
		
		SalesService sr = pr.getContext().getBean("faqdetail",SalesService.class);	
		
		HashMap<String, Object> mapres =(HashMap<String, Object>)sr.execute(map);
		
		return mapres;
	
	}
	//bannermovieget
	@RequestMapping(value = "/bannermovieget", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bannermovieget(@RequestBody Map<String,String> map, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
		
		
		
		PageeditService sr = pr.getContext().getBean("bannermovieget",PageeditService.class);	
		
		HashMap<String, Object> mapres =(HashMap<String, Object>)sr.execute(map);
		
		return mapres;
	
	}
	

}
