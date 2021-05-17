package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

//Service단
@Service
public class PageeditmovieinfoinsertReg implements PageeditService {

	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {// 여기에 movieinfodto
		System.out.println("movieinfo insertReg 서비스 진입");
		AlterDTO al = new AlterDTO();
		HashMap<String, Object> map = (HashMap) obj;		
		MovieInfoDTO mdto = (MovieInfoDTO) map.get("mdto");
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ArrayList<ActorDTO> adto = new ArrayList<>();

		for (int i = 0; i < mdto.getMactrs().split(",").length; i++) {
			ActorDTO actor = new ActorDTO();
			actor.setActorid(mdto.getMactrs().split(",")[i]);
			actor.setMovietitle(mdto.getMovietitle());
			
			adto.add(i, actor);
			
		}

		for (ActorDTO actor : adto) {
			System.out.println(actor);
			db.actormovieinsert(actor);
		}
		System.out.println("액터정보 in");
		ArrayList<CateDTO> cdto = new ArrayList<>();		
		for (int i = 0; i < mdto.getMcate().split(",").length; i++) {
			CateDTO cate = new CateDTO();
			cate.setMovietitle(mdto.getMovietitle());
			cate.setCate(mdto.getMcate().split(",")[i]);
			
			cdto.add(i,cate);			
		}
		for (CateDTO cate : cdto) {
			System.out.println(cate);
			db.catemovieinsert(cate);
		}
		System.out.println("카테정보 in");
		db.movieinfoinsert(mdto);
		
		System.out.println("영화정보 in");
		
		
		
		// 이미지 db저장
		
		
		
		
		
		
		
		
		

		al.setMsg("인서트 성공");
		al.setUrl("/admin/pageedit/movieinfolist");

//			}
//		}
		return al;
	}

}
