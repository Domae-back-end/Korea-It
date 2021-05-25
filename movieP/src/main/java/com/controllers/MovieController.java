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
import com.model.InfoDTO;
import com.model.LikeDTO;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieAction3;
import com.model.MovieAction4;
import com.model.MovieAction5;
import com.model.MovieAction6;
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

		System.out.println(service);
		if (service.endsWith("Reg")) {
			return "user/page/alert";
		}

		if (req.getParameter("submenu") != null) {
			String s = req.getParameter("submenu");
			return "/user/page/movie/submenu/" + s;
		}
		
		System.out.println("/user/page/index 로 이동");
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
		//박스오피스에서 검색했을 때 or 검색 안했을 때
		MovieAction3 res = pr.getContext().getBean("moviebefore", MovieAction3.class);
		return res.execute(req.getParameter("sch"));
	}

	@ModelAttribute("moviedataafter")
	Object mmAfter(HttpServletRequest req) {
		//상영예정작에서 검색했을 때
		MovieAction3 res = pr.getContext().getBean("movieafter", MovieAction3.class);
		return res.execute(req.getParameter("sch"));

	}
	
	@ModelAttribute("myreview")
	Object myReview(HttpServletRequest req) {

		//현재 request session으로 아이디 받아와서 내 review만 가져오
		InfoDTO info = new InfoDTO();
		
		
		if (req.getParameter("ind") != null) {
			
			MovieAction6 res = pr.getContext().getBean("myreview", MovieAction6.class);
			info.setUserid((String) req.getSession().getAttribute("sessionId"));
			info.setInd(Integer.parseInt(req.getParameter("ind")));
			return res.execute(info);
		}
		return null;
	}

	@ModelAttribute("moviereview")
	Object rr(HttpServletRequest req) {

		//현재 request session으로 아이디 받아와서 내 review만 가져오

		if (req.getParameter("ind") != null) {
			MovieAction2 res = pr.getContext().getBean("moviereview", MovieAction2.class);
			return res.execute(Integer.parseInt(req.getParameter("ind")));
		}
		return null;
	}

	@ModelAttribute("data")
	Object reviewreg(HttpServletRequest req, MovieReviewDTO dto, @PathVariable String service) {
		
		System.out.println("현재 로그인된 ID: "+req.getSession().getAttribute("sessionId"));
		
		if(service.equals("likeReg")) {
			
			InfoDTO info = new InfoDTO();
			info.setCg(req.getParameter("cg"));
			
			LikeDTO dd = new LikeDTO();
			dd.setM_index(Integer.parseInt(req.getParameter("m_index")));
			dd.setUserid((String) req.getSession().getAttribute("sessionId"));
			
			MovieAction5 res = pr.getContext().getBean("movie" + service, MovieAction5.class);
			return res.execute(dd, info);
		}
		
		if (service.equals("reviewinsertReg") || service.equals("reviewdeleteReg") || service.equals("likeReg")) {
			
			if (dto.getPostcontent() != "") {
				dto.setUserid((String) req.getSession().getAttribute("sessionId"));
				MovieAction4 res = pr.getContext().getBean("movie" + service, MovieAction4.class);
				return res.execute(dto);

			}
		}
		return null;
	}

}
