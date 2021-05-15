package com.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MovieAction;
import com.model.MovieInfoDTO;

@Controller
@RequestMapping("/user/movie/{cate}")
public class MovieController {

	@Resource
	Provider pr;
	
	@RequestMapping
	public String view(@PathVariable String cate) {
		return "user/page/movie/"+cate;
	}
	
	@ModelAttribute("moviedata")
	Object mm(@PathVariable String cate) {
		
		MovieAction res = pr.getContext().getBean("movie"+cate, MovieAction.class);
		return res.execute();
	}
	
	@ModelAttribute("moviedatabefore")
	Object mmBefore(@PathVariable String cate) {
		
		MovieAction res = pr.getContext().getBean("moviebefore", MovieAction.class);
		return res.execute();
	}
	
	@ModelAttribute("moviedataafter")
	Object mmAfter(@PathVariable String cate) {
		
		MovieAction res = pr.getContext().getBean("movieafter", MovieAction.class);
		return res.execute();
	}
}
