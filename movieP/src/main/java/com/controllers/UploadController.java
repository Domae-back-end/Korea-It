package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.admin.service.MovieTimeService;
import com.admin.service.PageeditService;
import com.admin.service.Provider;
import com.admin.service.SalesService;
import com.model.Menu;
import com.model.MovieInfoDTO;


@Controller
@RequestMapping("aaaa")
public class UploadController {
	
	@Resource
	Provider pr;
	
	@ModelAttribute("data")
	Object data(@PathVariable String service, MovieInfoDTO mdto,HttpServletRequest request) {
		//  문제.. multipart를 받을 수단이 없음.
		//String uploadPath = mulrequest.getRealPath("/images/uploadFiles");
		//System.out.println("uploadPath:"+uploadPath);
		System.out.println(" mdto에 mimg가 잘 들어왔다 .배열이!-----------------------------");
		MultipartFile[] array = mdto.getMimg();
		System.out.println("들어온 이미지갯수:"+array.length);
		System.out.println(array[0].getSize());
		System.out.println(array[0].getOriginalFilename());
		System.out.println(array[0].getName());
		System.out.println(array[0].getContentType());
		System.out.println("-----------------------------");
		
		
		System.out.println("pageedit-"+service+"실행");
		System.out.println(mdto);
		PageeditService sr = pr.getContext().getBean("pageedit"+service,PageeditService.class);
		
		
		Map<String, Object> obj= new HashMap<String, Object>();
		obj.put("service", service);
		obj.put("mdto", mdto);
		obj.put("request", request);
		//obj.put("mulrequest", mulrequest); //이렇게 다때려박아도 괜찮은건가.
		
		
		return sr.execute(obj);		
	}
	
	
	
	
	
	
	@ModelAttribute("bodyurl")
	String bodypageUrl(@PathVariable String service) {
		
		return "pageedit/"+service;
	}
	
	@ModelAttribute("submenu")
	ArrayList<Menu> subMenu( ) {
		System.out.println("서브메뉴들어간다.");
		HashMap<String, ArrayList<Menu>>map = new HashMap<>();
		
		map.put("pageedit", new ArrayList<Menu>());
		
		map.get("pageedit").add(new Menu("banner","메인베너관리"));
		map.get("pageedit").add(new Menu("noticelist","공지사항/뉴스"));
		map.get("pageedit").add(new Menu("movieinfolist","영화정보관리"));
		
		return map.get("pageedit");
	}
	
	
	@RequestMapping
	String mainpage(@PathVariable String service) {
		
		if(service.endsWith("Reg")) {
			return "admin/page/alter";
		}
		
		
		return "admin/index";
	}
	
}
