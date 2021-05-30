package com.controllers;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MemberAction;
import com.model.MemberDTO;
import com.model.Menu;
import com.model.PPPData;

@Controller
@RequestMapping("/member/{cate}/{service}")
public class MemberController {

	@Resource
	Provider pr;

	@ModelAttribute("memdata")
	Object ddd(@PathVariable String service, MemberDTO mdto, HttpSession session, HttpServletRequest request) {

		if (service.endsWith("Form") || service.endsWith("Find"))
			return null;
		
		if(service.startsWith("my"))
			service = "mypage";
		
		if(service.endsWith("mypurchase"))
			mdto.setPageKind("seemovie");

		MemberAction res = pr.getContext().getBean("member" + service, MemberAction.class);

		return res.execute(mdto, session, request);
	}

	@ModelAttribute
	PPPData pppData(@PathVariable String cate, @PathVariable String service) {
		
		if(cate.endsWith("mypage"))
			return new PPPData(cate, "mypageMain");
			
		return new PPPData(cate, service);
	}	
	
	@ModelAttribute("subMenu")
	Menu subMenu(@PathVariable String service) {
		
		HashMap<String, Menu> map = new HashMap<>();

		map.put("mypageMain", new Menu("mycinema", null));
		map.put("mycinema", new Menu("mycinema", null));
		map.put("myqna", new Menu("myqna", null));
		map.put("myinfor", new Menu("myinfor", null));
		map.put("mypurchase", new Menu("mypurchase", null));
		map.put("myinforchange", new Menu("myinforchange", null));
		map.put("mypwchange", new Menu("mypwchange", null));
		map.put("mymoviestroy", new Menu("mymoviestroy", null));
		
		return map.get(service);
	}
	
	@RequestMapping
	public String view(@PathVariable String cate, @PathVariable String service) {

		if(service.endsWith("Reg"))
			return "/user/home";
		
		if (service.endsWith("loginForm") || cate.endsWith("mypage"))
			return "user/page/index";

		return "user/page/" + cate + "/" + service;
	}
}
