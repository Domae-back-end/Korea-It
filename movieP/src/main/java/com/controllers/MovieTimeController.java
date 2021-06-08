package com.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieService;
import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.model.InitData;
import com.model.Menu;
import com.model.MovieTimeDTO;
import com.model.PPPData;


@Controller
@RequestMapping("admin/movietime/{cate}")
public class MovieTimeController {

	@Resource
	Provider pr;

	@ModelAttribute("data")
	Object data(@PathVariable String cate, MovieTimeDTO dto) {
		MovieTimeService sr = pr.getContext().getBean("MovieTime" + cate, MovieTimeService.class);
		return sr.execute(dto);
	}

	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String cate) {
		return "movietime/movie" + cate;
	}
	

	@RequestMapping
	String mainpage(@PathVariable String cate,HttpServletRequest request) {
				
		HttpSession sess= request.getSession();
		
		if(cate.endsWith("Reg")) {
			return "admin/page/alter";
			
		}
				return "admin/index";

			
	}

}
