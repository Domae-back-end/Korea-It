package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.model.ActorDTO;
import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MimgDTO;
import com.model.MinfListDTO;
import com.model.MinfoPageDTO;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;

//Service단
@Service
public class Pageeditmidetail implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		System.out.println("영화정보디테일서비스");
		HashMap<String, Object> map = (HashMap) obj;		
		System.out.println("들어온pdto:"+map.get("pdto"));
		MinfoPageDTO pdto=(MinfoPageDTO)map.get("pdto");
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		pdto.setStart(1);		//임의설정값.
		Integer m_index= Integer.parseInt(request.getParameter("mid"));		
		
		MovieInfoDTO res;		
		System.out.println("나오는것. : "+ db.movieDetail(m_index));
			res=db.movieDetail(m_index);
			String mactrs="",mcate="",movieimg="";
			String movietitle= res.getMovietitle();
			System.out.println(res);
			for (ActorDTO ee : db.pullactor(m_index)) {
				mactrs+=ee.getActorid()+",";
			}
			mactrs=mactrs.substring(0, mactrs.length()-1);
			for (CateDTO ee : db.pullcate(m_index)) {
				mcate+=ee.getCate()+",";
			}
			mcate= mcate.substring(0, mcate.length()-1);
			for (MimgDTO ee : db.pullimg(m_index)) {
				movieimg+=ee.getImgname()+",";
			}			
			res.setMactrs(mactrs);
			res.setMcate(mcate);
			res.setMovieimg(movieimg);			
				
		System.out.println("Detail 끗. ");
		return res;
	}
	
}