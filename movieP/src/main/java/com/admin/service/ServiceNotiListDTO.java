package com.admin.service;

import java.util.List;

import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import lombok.Data;

@Data
public class ServiceNotiListDTO {
	
	List<ServiceFullDTO> sfdto;// 내가 5개 단위로  or  10개 단위로 쪼개서 db에서 물어온 실제  글 내용.
	 // ServiceNoticeDTO
	
	//SearchDTO sdto;
	// 검색어, 카테고리정보.  >> 어느 유형 검색이니? 정보 있고.  검색어 무엇? 정보있고.
	
	ServiceNoticePageDTO snpdto;// 페이지정보.

}
