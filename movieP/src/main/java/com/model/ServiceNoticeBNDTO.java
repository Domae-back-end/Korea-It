package com.model;

import lombok.Data;

@Data
public class ServiceNoticeBNDTO {

	ServiceFullDTO next;
	ServiceFullDTO before;
	ServiceFullDTO now;
	
	
//	next글:null
//	before글:ServiceFullDTO(kind2=null, schkey=null, noticeindex=107, noticecate=movie, noticetitle=번호는 107번이지롱, noticecont=107번 글이다?

}
