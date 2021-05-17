package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
public class Pageeditmovieinfolist implements PageeditService {
	

	@Resource
	DbMapper db;
	
	@Override
	public Object execute(Object obj) {
		HashMap<String, Object> map = (HashMap) obj;		
		
		System.out.println("들어온pdto:"+map.get("pdto"));
		MinfoPageDTO pdto=(MinfoPageDTO)map.get("pdto");
		
		
		pdto.setStart(1);		
		MinfListDTO res= new MinfListDTO();		
		List<MovieInfoDTO> answer= db.movieinfolist(map);		
		System.out.println("list 화면으로 가져간다. >>뽑아올");
		System.out.println("갯수 : "+ db.movieinfolist(map).size());
		for (MovieInfoDTO each : answer) {
			String mactrs="",mcate="",movieimg="";
			String movietitle= each.getMovietitle();
			System.out.println(each);
			for (ActorDTO ee : db.pullactor(movietitle)) {
				mactrs+=ee.getActorid()+",";
			}
			if(mactrs.length()>1)
			mactrs=mactrs.substring(0, mactrs.length()-1);
			//List<CateDTO> pullcate(String movietitle);
			//List<MimgDTO> pullimg(String movietitle);
			for (CateDTO ee : db.pullcate(movietitle)) {
				mcate+=ee.getCate()+",";
			}
			if(mcate.length()>1)
			mcate= mcate.substring(0, mcate.length()-1);
			for (MimgDTO ee : db.pullimg(movietitle)) {
				movieimg+=ee.getImgname();
			}			
			each.setMactrs(mactrs);
			each.setMcate(mcate);
			each.setMovieimg(movieimg);			
		}		
		//MinfListDTO( movielist >정보에 리스트가 있음.)
		res.setMovielist(answer);
		System.out.println("result는 있음.");
		return res;
	}
	
}
