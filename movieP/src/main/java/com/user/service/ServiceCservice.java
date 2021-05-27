package com.user.service;

import javax.servlet.http.HttpSession;

import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

public interface ServiceCservice {
	
	Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO, HttpSession session);

}
