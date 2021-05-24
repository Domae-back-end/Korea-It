package com.user.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.AlterDTO;
import com.model.DateDTO;
import com.model.DbMapper;
import com.model.EndTimeDTO;
import com.model.MovieAction4;
import com.model.MovieReviewDTO;

@Service
public class MoviereviewinsertReg implements MovieAction4{

	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(MovieReviewDTO dto) {
		
		
		//System.out.println("MovieReviewInsertReg 서비스빈. 영화번호"+dto.getCate());
		AlterDTO alt = new AlterDTO();
		alt.setMsg(dto.getUserid()+"님 관람평 작성 완료.");
		alt.setUrl( "moviedetail?sub=review&ind="+dto.getCate());
		
		if(dto.getUserid()==null) {
			alt.setMsg("로그인이 필요한 기능입니다.");
			alt.setUrl("/member/login/loginForm");
			return alt;
		}
		
		int cnt =0;
		//System.out.println("영화 관람 검사");
		//해당 영화를 관람했는지 검사해야 함. userid=아이디 cate=영화코드
		List<EndTimeDTO> list = mm.pullTInfo(dto);
		
		Iterator<EndTimeDTO> it = list.iterator();
		while(it.hasNext()) {
			EndTimeDTO etd = it.next();
			DateDTO da = mm.pullEndTime(etd);
			da.setEnd_time();
			if(da.getEnd_time() ==null) {
				continue;
			}
			if(da.getEnd_time().before( new Date() ) ) {
				//현재날짜보다 뒤 
				etd.setEndtime(da.getEnd_time());
				cnt++;
			}
		
		//System.out.println("id: "+etd.getUserid()+" sector: "+etd.getMoviesector()+" endtime: "+etd.getEndtime());

		}
		
		//System.out.println("현재 이 영화를 본 상태인 것: "+cnt);
		
		if(cnt <= 0) {
			alt.setMsg("영화를 관람하신 후 작성하세요");
			return alt;
		}
		
		//System.out.println("reg에서 보는 id: "+dto.getUserid());


		Integer sk = mm.reviewinsert(dto);
		if(sk <= 0) {
			alt.setMsg("이미 관람평을 등록하셨습니다.");
		}
		
		return alt;
	}
	
}
