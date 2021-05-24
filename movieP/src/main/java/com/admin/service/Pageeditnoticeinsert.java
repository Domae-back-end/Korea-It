package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditnoticeinsert implements PageeditService {
	// wait
	Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String , Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npdto= (ServiceNoticePageDTO)orimap.get("npDTO");
		
		
		logger.info("공지 insert 화면 페이지 넘버: "+ npdto.getPage()); // 이제 syso 필요없음.
		
		
		
		// 유캔두잇
		//근데 로거가 머임요  syso 보다 서버에 부담 덜되는거? 
		//  그 자바로   코딩테스트 볼때  syso나   scanner 이런거 절대쓰면 안되는데 그게 java IO 써서래요  것떄메 시간 뺏겨서 
		// logger 은 시간 안걸리는 거래요 대충
		
		//service라는 이름의 키로 >  table 이름을 담는 클래스 dto? 
		
		
		//List<ServiceNoticeDTO> result = 
				
			//	db.insertNotice();
		
		//System.out.println("db갓"+result.size());
		
		return npdto.getPage();// int 리턴 jsp가 ${data} 알아서 해석
	}

	
}
