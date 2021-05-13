package com.controllers;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.Provider;
import com.model.MovieAction;
import com.model.MovieMapper;

@Controller
@RequestMapping("/user/{cate}/{service}")
public class UserController {

	@Resource
	Provider myProvider;
	
	@Resource
	MovieMapper mm;
	
	@RequestMapping
	public String view(@PathVariable String service, @PathVariable String cate) {
		//user.main.index 들어가면 메인페이지
		//user.movie.list 들어가면 영화 리스트 페이지
		//user.카테고리.(해당jsp이름) d
		String go = "user/"+service;
		
		if(!cate.equals("main")) {
				go = "user/page/"+cate+"/"+service;
		}
			
		return go;
	}
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "body";
	}
	
	//@ModelAttribute("moviedata")
	//Object mm(@PathVariable String service) {
	//	
	//	System.out.println(service);
	//	MovieAction res = myProvider.getContext().getBean("movie"+service, MovieAction.class);
	//	return res.execute();
	//}
	
}
