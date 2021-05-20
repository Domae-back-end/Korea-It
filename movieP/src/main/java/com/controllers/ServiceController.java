package com.controllers;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.ServicePersonalDTO;
import com.user.service.ServiceCservice;

@Controller
@RequestMapping("/user/serviceC/{service}")
public class ServiceController {
	
	@Resource
	Provider pr; //@Service이 붙은애들 읽음

	
	
	@ModelAttribute("data")
	public Object data(@PathVariable String service, HttpServletRequest request, ServicePersonalDTO persDTO
			//, ServiceNoticePageDTO nDTO
			) {		
		//service = qnainsertReg (1대1문의 jsp에서 따옴)
		
		ServiceCservice sr = pr.getContext().getBean("serviceC"+service, ServiceCservice.class);	
		// "serviceC"+service  서비스@  놈을 데려와라. serviceCqnainsertReg >   ServiceCqnainsertReg.java 이렇게만들면.
		
		HashMap<String, Object> map = new  HashMap<>();
		
		map.put("request", request);
		map.put("persDTO", persDTO);
		map.put("service", service);
		//map.put("nDTO", nDTO);
		
		
		return sr.execute(map);// 서비스도 바뀌고 return 값도 바뀌고..
	}
	
	
	
	@ModelAttribute("bodyurl") 
	String bodygogo(@PathVariable String service) {	
		
		return "serviceC/"+service; //메인
	}

	
	
	
	@RequestMapping // 보내주는페이지
	public String view(@PathVariable String service) { //일단 처음에 들어오면 무조건 index로가. index에서 include된 bodyurl만 밑에꺼로 포함되서 가져와
		
		if(service.endsWith("Reg")) {
			return "user/page/alert";
		}
		
		return "user/index";
	}
	
}
