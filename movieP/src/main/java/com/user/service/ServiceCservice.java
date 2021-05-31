package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

public interface ServiceCservice {
	
	Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session, HttpServletRequest request, MultipartFile file);

}
