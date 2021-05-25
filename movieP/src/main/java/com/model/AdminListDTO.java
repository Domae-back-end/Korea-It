package com.model;

import java.util.List;

import lombok.Data;
@Data
public class AdminListDTO {
	List<MovieInfoDTO> sfdto;// 내가 5개 단위로  or  10개 단위로 쪼개서 db에서 물어온 실제  글 내용.
	 // ServiceNoticeDTO
	
	//SearchDTO sdto;
	// 검색어, 카테고리정보.  >> 어느 유형 검색이니? 정보 있고.  검색어 무엇? 정보있고.
	List<MovieInfoDTO> movielist;
	MovieInfoDTO midto;
	//MinfoPageDTO mpdto; 삭제예정 .
	ServiceNoticePageDTO pdto;
	ServiceNoticePageDTO snpdto;// 페이지정보.
	String posterurl;
	ServiceFullDTO sfuldto;
}
