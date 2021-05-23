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
		AlterDTO dd = new AlterDTO();
		dd.setMsg("좋아요한 영화에 추가되었습니다.");
		dd.setUrl("/user/movie/moviemain?cg="+d.getCg());
		
		System.out.println("ldto의 userid : "+ldto.getUserid());
		
		if(ldto.getUserid()==null) {
			dd.setMsg("로그인이 필요합니다.");
			dd.setUrl("/member/login/loginForm");
			return dd;
		}
		System.out.println("likeDTO로 전달되는 userid : "+ldto.getUserid());
		System.out.println("likeDTO로 전달되는 m_index : "+ldto.getM_index());
	
		Integer s = mm.likeupdate(ldto);
		System.out.println("insert된 개수: "+s);

		
		if(s <= 0) {
			dd.setMsg("이미 좋아요 한 영화입니다.");
		}
		

		return dd;
	}
	
	
}
