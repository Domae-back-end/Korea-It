package com.admin.service;

import java.util.ArrayList;
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
import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

//Service단
@Service
public class PageeditmovieinfoinsertReg implements PageeditService {

	@Resource
	DbMapper db;
	
	@Resource
	FileupService fservice;

	@Override
	public Object execute(Object obj) {// 여기에 movieinfodto
		System.out.println("movieinfo insertReg 서비스 진입");
		HashMap<String, Object> map = (HashMap) obj;		
		MovieInfoDTO mdto = (MovieInfoDTO) map.get("mdto");
		HttpServletRequest request = (HttpServletRequest)map.get("request");	
		db.movieinfoinsert(mdto);// 일단 집어넣고.	
		int m_index =db.getIndexByTitle(mdto.getMovietitle());
		HashSet<String> imgnames= new HashSet<>();
		if(mdto.getInfoimg()!=null) {			
			System.out.println("이미지가 있다.");
			//FileupService fservice = new FileupService();//용량이 초과할 경우 > 바로 alter 리턴.
			fservice.fileup(mdto.getInfoimg(), request,  mdto.getMovietitle(),m_index);
			for (MultipartFile mf : mdto.getInfoimg()) {
				imgnames.add(mf.getOriginalFilename());
			}			
		}		
		AlterDTO al = new AlterDTO();	
		ArrayList<ActorDTO> adto = new ArrayList<>();
		for (int i = 0; i < mdto.getMactrs().split(",").length; i++) {
			ActorDTO actor = new ActorDTO();
			actor.setActorid(mdto.getMactrs().split(",")[i]);
			actor.setM_index(m_index);;			
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
			cate.setM_index(m_index);;
			cate.setCate(mdto.getMcate().split(",")[i]);			
			cdto.add(i,cate);			
		}
		for (CateDTO cate : cdto) {
			System.out.println(cate);
			db.catemovieinsert(cate);
		}
		System.out.println("카테정보 in");
	
		
		
		
		// 이미지 db저장
		
		
		
		
		
		
		
		
		

		al.setMsg("인서트 성공");
		al.setUrl("/admin/pageedit/movieinfolist");

//			}
//		}
		return al;
	}

}
