package com.admin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.model.ActorDTO;
import com.model.AlterDTO;
import com.model.BannerDTO;
import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

//Service단
@Service
public class PageeditbannersaveReg implements PageeditService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	@Resource
	DbMapper db;
	
	@Resource
	BannerFileupService fservice;

	@Override
	public Object execute(Object obj) {// 여기에 movieinfodto
		HashMap<String, Object> map = (HashMap) obj;		
		BannerDTO banDTO = (BannerDTO) map.get("banDTO");
		HttpServletRequest request =(HttpServletRequest)map.get("request");
		if(banDTO.getFf()!=null)	
		logger.debug("fileUp 실행 : {}",banDTO.getFf().length);
		if(banDTO.getFf()!=null){
		fservice.fileup2(banDTO.getFf(), banDTO.getStill(), request);
		}
		AlterDTO al = new AlterDTO();	
		
		
		

		al.setMsg("저장 완료되었습니다.(default)");
		al.setUrl("/admin/pageedit/banner");

//			}
//		}
		return al;
	}

}
