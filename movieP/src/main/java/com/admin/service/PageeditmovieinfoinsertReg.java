package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

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
		AlterDTO al = new AlterDTO();
		HashMap<String, Object> map = (HashMap) obj;

		MovieInfoDTO mdto = (MovieInfoDTO) map.get("mdto");
		System.out.println("reg 화면 진입");
		System.out.println(mdto);

		// 유효성은 자바스크립트에서 처리 .
		// MovieInfoDTO(m_index=null, mplaytime=123, star=null,
		// movietitle=아아, mdir=아아, mactrs=아아,바바, mcate=아아,바바, mplot=아아
		System.out.println("배우 몇명:" + mdto.getMactrs().split(",").length);
		// 배우 id 가 담겨있음.
		System.out.println("카테 몇개:" + mdto.getMcate().split(",").length);
		// 카테 담겨있음.
		// id 코드 + 영화 정보가 만들어진다.
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
		// db.actormovieinsert(adto);

		// db.catemovieinsert(cdto);

		al.setMsg("인서트 성공");
		al.setUrl("/admin/pageedit/movieinfolist");

//			}
//		}
		return al;
	}

}
