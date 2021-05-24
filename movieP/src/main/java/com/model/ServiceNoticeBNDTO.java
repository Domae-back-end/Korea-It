package com.model;

import lombok.Data;

@Data
public class ServiceNoticeBNDTO {

	ServiceFullDTO next;
	ServiceFullDTO before;
	ServiceFullDTO now;
	ServiceNoticePageDTO npDTO;
	
	
}
