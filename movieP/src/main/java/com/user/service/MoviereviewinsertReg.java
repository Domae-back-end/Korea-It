package com.user.service;

import java.util.Date;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DateDTO;
import com.model.DbMapper;
import com.model.EndTimeDTO;
import com.model.MovieAction6;
import com.model.MovieInfoDTO;
import com.model.MovieReviewDTO;
import com.model.MoviewatchInfo;


@Service
public class MoviereviewinsertReg implements MovieAction6{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Object dto1) {
		
		MovieReviewDTO dto = (MovieReviewDTO)dto1;
		//System.out.println("MovieReviewInsertReg 서비스빈. 영화번호"+dto.getCate());
		AlterDTO alt = new AlterDTO();
		alt.setMsg(dto.getUserid()+"님 관람평 작성 완료.");
		alt.setUrl( "moviedetail?sub=review&ind="+dto.getCate());
		
		if(dto.getUserid()==null) {
			alt.setMsg("로그인이 필요한 기능입니다.");
			alt.setUrl("/member/login/loginForm");
			return alt;
		}
		
		dto.setMovietitle(mm.foundmoviename(Integer.parseInt(dto.getCate()) ));
		//영화를 관람했는지 검사하기
		//현재 dto에 저장된 값: cate:영화코드, userid 
		//userid 이용해서 본 영화 모두 끌어오기
		List<MoviewatchInfo> watchedList = mm.watched(dto);
		int cnt =0;
		//헤당 time_index 가지고 영화 찾기
		Iterator<MoviewatchInfo> it = watchedList.iterator();
		while(it.hasNext()) {
			MoviewatchInfo mwi = it.next();
			DateDTO dd = (DateDTO) mm.BringEndTime(mwi.getTime_index());
			dd.setEnd_time();
			//내가 본 영화들의 날짜와 이름을 저장함. 이제 이 영화들 중 현재 선택된 영화를 알아내기
			if(dto.getMovietitle().equals(dd.getMovietitle())) {
				//현재 선택된 영화와 영화이름이 같다면
				if(dd.getEnd_time().before(new Date())) {
					cnt++;
					//System.out.println("관람평을 쓸 수 있는 영화 : "+ dd.getMovietitle()+"끝나는 시간: "+dd.getEnd_time());
				}
			}
		}
		
		if(cnt <= 0) {
			alt.setMsg("영화를 관람 후 관람평을 써주세요.");
			return alt;
		}

		Integer sk = mm.reviewinsert(dto);
		if(sk <= 0) {
			alt.setMsg("이미 관람평을 등록하셨습니다.");
		}
		
		return alt;
	}
	
}
