package com.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DbMapper;
import com.model.InfoDTO;
import com.model.LikeDTO;
import com.model.MovieAction2;
import com.model.MovieAction5;

@Service
public class MovielikeReg implements MovieAction5{

	@Resource
	DbMapper mm;
	

	@Override
	public Object execute(Object dto, Object info) {
		
		
		LikeDTO ldto =(LikeDTO)dto; 
		InfoDTO d = (InfoDTO)info;
		System.out.println("likeDTO로 전달되는 userid : "+ldto.getUserid());
		System.out.println("likeDTO로 전달되는 m_index : "+ldto.getM_index());
		mm.likeupdate(ldto);
		
		AlterDTO dd = new AlterDTO();
		dd.setMsg("좋아요한 영화에 추가되었습니다.");
		dd.setUrl("/user/movie/moviemain?cg="+d.getCg());
		return dd;
	}
	
	
}
