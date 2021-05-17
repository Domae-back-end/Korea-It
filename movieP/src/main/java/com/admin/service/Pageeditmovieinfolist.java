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
	
	@Override// list Service
	public Object execute(Object obj) {
		HashMap<String, Object> map = (HashMap) obj;		
		MinfoPageDTO pdto=(MinfoPageDTO)map.get("pdto");
		MovieInfoDTO mdto=(MovieInfoDTO)map.get("mdto");
		
		System.out.println("p:"+pdto);
		System.out.println("m:"+mdto);
		pdto.setStart(0);		
		
		MinfListDTO res= new MinfListDTO();		
		List<MovieInfoDTO> answer= db.movieinfolist(map);		

		System.out.println("갯수 : "+ db.movieinfolist(map).size());
		for (MovieInfoDTO each : answer) {
			String mactrs="",mcate="",movieimg="";
			String movietitle= each.getMovietitle();
			System.out.println(each);
			Integer m_index =db.getIndexByTitle(movietitle);
			for (ActorDTO ee : db.pullactor(m_index)) {
				mactrs+=ee.getActorid()+",";
			}
			if(mactrs.length()>1)
			mactrs=mactrs.substring(0, mactrs.length()-1);
				for (CateDTO ee : db.pullcate(m_index)) {
				mcate+=ee.getCate()+",";
			}
			if(mcate.length()>1)
			mcate= mcate.substring(0, mcate.length()-1);
			
			for (MimgDTO ee : db.pullimg(m_index)) {
				movieimg+=ee.getImgname();
				
				if(ee.getImgname().contains("poster")) {
					each.setPosterUrl("moviedata/"+ee.getImgname());
					System.out.println("포스터주소:"+movietitle+"/"+ee.getImgname());
				}
				
			}			
			each.setMactrs(mactrs);
			each.setMcate(mcate);
			each.setMovieimg(movieimg);			
		}		
		
		res.setMovielist(answer);
		return res;
	}
	
}
