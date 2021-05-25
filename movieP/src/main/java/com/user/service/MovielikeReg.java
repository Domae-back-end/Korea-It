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
		
		
		if(ldto.getUserid()==null) {
			dd.setMsg("로그인이 필요합니다.");
			dd.setUrl("/member/login/loginForm");
			return dd;
		}
		//System.out.println("likeDTO로 전달되는 userid : "+ldto.getUserid());
		//System.out.println("likeDTO로 전달되는 m_index : "+ldto.getM_index());
	
		//userlikes 테이블에 컬럼 추가
	
		
		Integer k = mm.selectlike(ldto.getM_index()); //현재 좋아요 수 가져오기
		
		//좋아요 이미 했는지 검사 s값이 0이면 이미 좋아요한 영화가 있다는 것.
		Integer s = mm.likeupdate(ldto);
		//System.out.println("insert된 개수: "+s);

		//insert된 값이 없다
		if(s <= 0) {
			dd.setMsg("이미 좋아요 한 영화입니다. 좋아요를 취소합니다.");
			ldto.setNow_like(k-1); //현재 좋아요 된 값에서 -1 값을 넣어줌
			mm.updatemlike(ldto); // movieinfo의 mlike의 값을 업데이트
			mm.deletelike(ldto); //userlikes에서 해당 영화 좋아요한 튜플 없애기
			return dd;
		}
		
		//좋아요 한 것 겂으면 k+1하기
		ldto.setNow_like(k+1);
		mm.updatemlike(ldto);
		return dd;
	}
	
	
}
