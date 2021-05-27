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
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditmovieinfomodify implements PageeditService {
	
	
	
	Logger logger= LoggerFactory.getLogger(getClass());
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String, Object> orimap = (HashMap)obj;
		ServiceNoticePageDTO npDTO=   (ServiceNoticePageDTO)orimap.get("npDTO");
		ServiceFullDTO sfDTO = (ServiceFullDTO)orimap.get("sfDTO");
		MovieInfoDTO midto= (MovieInfoDTO)orimap.get("mdto");
		
		AdminListDTO result= new AdminListDTO();
		
		result.setMidto(db.getmovieinfobyidx(midto.getM_index()));
		
		logger.info(db.getmovieinfobyidx(midto.getM_index()).getMovietitle());
		
		
		
		
		
		
		
		
		
		return result;
	}
	
}
