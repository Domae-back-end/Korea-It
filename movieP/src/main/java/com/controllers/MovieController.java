package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MovieAction;

@Controller
@RequestMapping("/user/movie/{cate}")
public class MovieController {

	@Resource
	Provider pr;
	
	@RequestMapping
	public String view(@PathVariable String cate) {
		return "user/page/movie/"+cate;
	}
	
//	@ModelAttribute("moviedata")
//	Object mm(@PathVariable String service) {
//		
//		System.out.println(service);
//		MovieAction res = pr.getContext().getBean("movie"+service, MovieAction.class);
//		return res.execute();
//	}
	
}
