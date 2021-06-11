package com.admin.service;

import java.util.List;

import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

import lombok.Data;

@Data
public class ServiceNotiListDTO {
	
	List<ServiceFullDTO> sfdto;// 내가 5개 단위로  or  10개 단위로 쪼개서 db에서 물어온 실제  글 내용.
	 // ServiceNoticeDTO
	
	ServiceFullDTO onesfdto; //검색할때 검생창값불러오기(1개)
	
	ServiceNoticePageDTO snpdto;// 페이지정보.

	
	//serviceNoticeBNDTO
	ServiceFullDTO next;
	ServiceFullDTO before;
	ServiceFullDTO now;
	ServiceNoticePageDTO npDTO;
	
}
