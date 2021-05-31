package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MemberAction {

	Object execute(MemberDTO mdto, HttpSession session, HttpServletRequest request);
}
