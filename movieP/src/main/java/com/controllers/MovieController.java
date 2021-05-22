package com.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.service.Provider;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieAction3;
import com.model.MovieAction4;
import com.model.MovieInfoDTO;
import com.model.MovieReviewDTO;
import com.model.PPPData;

@Controller
@RequestMapping("/user/movie/{service}")
public class MovieController {

	@Resource
	Provider pr;

	@RequestMapping
	public String view(@PathVariable String service, HttpServletRequest req) {

		if (service.endsWith("Reg")) {
			return "user/page/alert";
		}

		if (req.getParameter("submenu") != null) {
			String s = req.getParameter("submenu");
			return "/user/page/movie/submenu/" + s;
		}
		return "user/page/index";
	}

	@ModelAttribute
	PPPData pppData(@PathVariable String service) {
		System.out.println(service);
		return new PPPData("movie", service);
	}

	@ModelAttribute("moviedata")
	Object mm(@PathVariable String service) {

		MovieAction res = pr.getContext().getBean("movielist", MovieAction.class);
		return res.execute();
	}

	@ModelAttribute("moviedetail")
	Object dd(HttpServletRequest req) {

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("moviedetail", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("movieactor")
	Object aa(HttpServletRequest req) {

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("movieactor", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("movieimage")
	Object ii(HttpServletRequest req) {

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("movieimg", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("moviecate")
	Object cc(HttpServletRequest req) {

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("moviecate", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("moviedatabefore")
	Object mmBefore(HttpServletRequest req) {

		MovieAction3 res = pr.getContext().getBean("moviebefore", MovieAction3.class);
		return res.execute(req.getParameter("sch"));
	}

	@ModelAttribute("moviedataafter")
	Object mmAfter(HttpServletRequest req) {

		MovieAction3 res = pr.getContext().getBean("movieafter", MovieAction3.class);
		return res.execute(req.getParameter("sch"));

	}

	@ModelAttribute("moviereview")
	Object rr(HttpServletRequest req) {

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("moviereview", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("data")
	Object reviewreg(HttpServletRequest req, MovieReviewDTO dto, @PathVariable String service) {
		if (service.equals("reviewinsertReg") || service.equals("reviewdeleteReg")) {
			req.getSession().setAttribute("userId", "Hogu");
			
			if (dto.getPostcontent() != "") {
				dto.setUserid((String)req.getSession().getAttribute("userId"));
				System.out.println("reviewDTO:" + dto);
				//
				MovieAction4 res = pr.getContext().getBean("movie" + service, MovieAction4.class);
				System.out.println(service + "클래스실행.");
				return res.execute(dto);

			}
		}
		return null;
	}

}
