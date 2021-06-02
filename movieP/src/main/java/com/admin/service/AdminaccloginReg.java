package com.admin.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.model.AdminaccDTO;
import com.model.AlterDTO;
import com.model.DbMapper;
@Service
public class AdminaccloginReg implements Adminaccservice {
	
	

	@Resource
	DbMapper db;


	@Override
	public Object execute(Map<String, Object> obj) {
		// TODO Auto-generated method stub
		HashMap<String, Object> orimap = (HashMap)obj;
		HttpServletRequest request=   (HttpServletRequest)orimap.get("request");
		AdminaccDTO adacDTO=  (AdminaccDTO)orimap.get("adacDTO");
		
		AdminaccDTO result = db.adminloginCheck(adacDTO);
		

		
		//
		AlterDTO al = new AlterDTO();
		al.setUrl("/admin" );
		al.setMsg("로그인 정보를 제대로 입력해주세요 ");


		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("adacDTO", adacDTO);
			System.out.println(adacDTO);
			al.setMsg(result.getAdminnick()+" 님 환영합니다 관리자 사이트 로그인성공");	
			
		}//
		
		
		
		
		
		
		
		
		return al;
	}

}
