package com.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Adminaccservice;
import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.model.AdminaccDTO;
import com.model.BannerDTO;
import com.model.MemberNaverAction;
import com.model.MinfoPageDTO;
import com.model.MovieInfoDTO;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

@Controller
@RequestMapping("admin/account/{service}") // member/  ddd
public class AdminAccountController {
	
	
	
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service,HttpServletRequest request,HttpServletResponse response, 

			AdminaccDTO adacDTO
			
			
			) {
		System.out.println("account-"+service+"실행");
		//System.out.println("Mdto:"+mdto); //  AdminaccloginReg
		System.out.println("adacDTO=="+adacDTO);
		Adminaccservice sr = pr.getContext().getBean("adminacc"+service,Adminaccservice.class);		
				// loginReg  logout
		Map<String, Object> obj= new HashMap<String, Object>();
		obj.put("adacDTO", adacDTO);
		obj.put("request", request);
		obj.put("response",response);
		
		//
		
		return sr.execute(obj);	// has > servie,mdto,req, imgnames,pdto	
	}



	@RequestMapping
	String view(@PathVariable String service) {	// 세션체킹 
		if(service.endsWith("Reg")) {
			return "admin/page/alter";
			}
	
		return "admin/loginpage";// 기본적으로 로그인페이지로 .
	}
}
