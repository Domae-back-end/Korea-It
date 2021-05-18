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

	@Resource
	DbMapper db;
	
	@Resource
	BannerFileupService fservice;

	@Override
	public Object execute(Object obj) {// 여기에 movieinfodto
		System.out.println("movieinfo insertReg 서비스 진입");
		HashMap<String, Object> map = (HashMap) obj;		
		BannerDTO banDTO = (BannerDTO) map.get("banDTO");
		HttpServletRequest request =(HttpServletRequest)map.get("request");
		if(banDTO.getFf()!=null)
		System.out.println("올라온이미지갯수:	"+banDTO.getFf().length);
		if(banDTO.getStill()!=null) {
		System.out.println("유지된갯수"+	banDTO.getStill().length);
		System.out.println("남은애들"+Arrays.toString(banDTO.getStill()));
		}
		if(banDTO.getFf()!=null){
		fservice.fileup2(banDTO.getFf(), banDTO.getStill(), request);
		}
		
		
		
		
		AlterDTO al = new AlterDTO();	
		
		
		

		al.setMsg("저장 실패(default)");
		al.setUrl("/admin/pageedit/banner");

//			}
//		}
		return al;
	}

}
