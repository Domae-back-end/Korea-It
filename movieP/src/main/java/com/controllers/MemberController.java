package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MovieAction;

@Controller
@RequestMapping("/user/member/{cate}/{service}")
public class MemberController {

	@Resource
	Provider pr;
	
	@RequestMapping
	public String view(@PathVariable String cate, @PathVariable String service) {
		return "user/page/member/"+cate+"/"+service;
	}

	
}
