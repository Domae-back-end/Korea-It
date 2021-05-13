package com.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.MovieTimeService;
import com.admin.service.Provider;
import com.model.MovieTimeDTO;

@Controller
@RequestMapping("admin/movietime/{cate}")

public class MovieTimeController {

	@Resource
	Provider pr;

	@ModelAttribute("data")
	Object data(@PathVariable String cate, String dal, String el) {
		if (dal != null && el != null) {
			MovieTimeService sr = pr.getContext().getBean("MovieTime" + cate, MovieTimeService.class);
			return sr.execute(dal, el);
		}
		return new ArrayList<MovieTimeDTO>();
	}

	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String cate) {
		return "movietime/movie" + cate;
	}

	@RequestMapping
	String mainpage() {
		return "admin/index";
	}

}
