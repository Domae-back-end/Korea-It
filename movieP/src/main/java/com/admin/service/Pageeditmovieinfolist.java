package com.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.ActorDTO;
import com.model.AdminListDTO;
import com.model.CateDTO;
import com.model.DbMapper;
import com.model.MimgDTO;
import com.model.MinfListDTO;
import com.model.MinfoPageDTO;
import com.model.MovieInfoDTO;
import com.model.MovieTimeDTO;
import com.model.ServiceNoticePageDTO;

//Service단
@Service
public class Pageeditmovieinfolist implements PageeditService {
	

	@Resource
	DbMapper db;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override// movieinfolist Service
	public Object execute(Object obj) {
		HashMap<String, Object> map = (HashMap) obj;		
		
		MovieInfoDTO mdto=(MovieInfoDTO)map.get("mdto");
		ServiceNoticePageDTO npDTO=   (ServiceNoticePageDTO)map.get("npDTO");
		npDTO.setTablename("movieinfo");// 영화테이블에서 자료갯수 가져올거니깐.
		
		System.out.println("m:"+mdto);
		
		//MinfListDTO res= new MinfListDTO();	// 최종 반환형태.	
		AdminListDTO res= new AdminListDTO();
		HashMap<String, Object> totalmap = new HashMap<>();
		totalmap.put("pDTO", npDTO);
		
		totalmap.put("mDTO", mdto);
		//
		System.out.println(npDTO+"\n테이블:"+npDTO.getTablename());
		System.out.println("pagedto init");
		npDTO.initfaq(db, totalmap);		
		
		
		List<MovieInfoDTO> answer= db.movieinfolist(totalmap);	//검색어는mDTO에,
		//페이지정보 pDTO에 .		
		System.out.println("검색된갯수 : "+ db.movieinfolist(totalmap).size());
		
		for (MovieInfoDTO each : answer) {
			String mactrs="",mcate="",movieimg="";
			String movietitle= each.getMovietitle();
			System.out.println(each);
			Integer m_index =db.getIndexByTitle(movietitle);
			for (ActorDTO ee : db.pullactor(m_index)) {
				mactrs+=ee.getActorname()+",";
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
		}		// 가공하여서 리스트화면에 출력.
		
		
		
		//페이지 정리과정 

	
		
		res.setMovielist(answer);
		res.setPdto(npDTO);// pdto>jsp에서쓰고 ,
		
		
		
		return res; // map 형태가 아닌 클래스들 담은 클래스 형태로 외부전달
	}
	
}
