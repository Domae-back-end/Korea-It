package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.AdminListDTO;
import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class PageeditmovieinfomodifyReg implements PageeditService {
	
	//
	Logger logger= LoggerFactory.getLogger(getClass());
	
	//movieinfomodifyReg
	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String, Object> orimap = (HashMap)obj;
		
		//ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");
		MovieInfoDTO midto= (MovieInfoDTO)orimap.get("mdto");
		ServiceNoticePageDTO pagedto =(ServiceNoticePageDTO)orimap.get("npDTO");
		//logger.info("수정하는 번호:"+midto.getM_index());
		logger.info("페이지"+pagedto.getPage());
		logger.info("data수정중....");
		logger.info(midto.getM_index()+" 번 data수정중...."+ midto.getMovietitle());
		
		
		
		AdminListDTO result= new AdminListDTO();
		
		
		db.updateMovieinfo(midto);
		
		
		AlterDTO al = new AlterDTO();
		
		al.setMsg("만드는 중이지만 수정되었습니다.");
		al.setUrl("movieinfolist?page="+pagedto.getPage());
		
		
		
		
		
		return al;
	}
	
}
