package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MemberAction;
import com.model.MemberDTO;
import com.model.PPPData;

@Controller
@RequestMapping("/member/{cate}/{service}")
public class MemberController {

	@Resource
	Provider pr;

	@ModelAttribute("memdata")
	Object ddd(@PathVariable String service, MemberDTO mdto) {

		if (service.endsWith("Form") || service.endsWith("Find"))
			return null;

		MemberAction res = pr.getContext().getBean("member" + service, MemberAction.class);

		return res.execute(mdto);
	}

	@ModelAttribute
	PPPData pppData(@PathVariable String cate, @PathVariable String service) {
		
		return new PPPData(cate, service);
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
