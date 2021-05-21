package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class ServiceCqnainsertReg implements ServiceCservice {//빈 창고에 등록이되는데.

	@Resource
	DbMapper db;

	
	
	@Override
	public Object execute(ServiceNoticePageDTO npDTO, ServiceFullDTO sfDTO) {
		System.out.println("빈 이름 serviceCqnainsertReg 소환됨dddddddddd");
		
//		HashMap<String, Object> map= (HashMap<String, Object>)obj;
//		ServicePersonalDTO persDTO = (ServicePersonalDTO)map.get("persDTO");
//		
//		HttpServletRequest request = (HttpServletRequest)map.get("request");
//		//상상 .
//		HttpSession session = request.getSession();
//		// 가짜..
//		session.setAttribute("id", "bbb111");
//		
//		
//		//진짜.
//		persDTO.setPersid((String)session.getAttribute("id"));
//		persDTO.setPersimg(persDTO.getFile().getOriginalFilename());
//		
//		System.out.println("1:1문의등록내용:" +persDTO);
//		System.out.println("파일이름:"+persDTO.getFile().getOriginalFilename());
		
		
		//재료완성 > 재료 넣어서 메서드.
		
		db.insertPersQna(sfDTO);
		
		
		

		AlterDTO ad = new  AlterDTO();
		
		ad.setMsg("1대1 문의가 등록되었습니다!");
		ad.setUrl("/user/serviceC/servicePersonal");
		
		return ad;
	}

	
}
