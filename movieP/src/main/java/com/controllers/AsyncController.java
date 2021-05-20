package com.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
public class AsyncController {
//
//	@Autowired
//	private memService memServiceIm;
//
//	@Autowired
//	private prodService prodServiceIm;
//
//	@Autowired
//	private userService userServiceIm;



	@RequestMapping(value = "/salesGraphSltView.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> duplCheckByName(@RequestBody Map<String, String> map) {// @RequestBody JSON data "형식" 이라
																						// 필요 >> data :
																						// JSON.stringify(sample),
		Map<String, String> result = map;

		
		return result;
	}

	

	@RequestMapping(value = "/salesTableSltView.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> asynclogin(String id, String pw, HttpServletRequest req, HttpSession httpSession) {// @RequestBody
																													// JSON.stringify(sample),
		
		Map<String, String> result = new HashMap<String, String>();
	
		
		
		return result;
		// 로그인 끝.

	}

	
	

}
