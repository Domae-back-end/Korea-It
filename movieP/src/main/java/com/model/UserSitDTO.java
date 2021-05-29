package com.model;

import lombok.Data;

@Data
public class UserSitDTO {
	Integer m_index,time_index;
	String seatNo,userid;
	public UserSitDTO(Integer time_index, String seatNo, String userid) {
		this.time_index = time_index;
		this.seatNo = seatNo;
		this.userid = userid;
	}
	
	
	public UserSitDTO() {
		// TODO Auto-generated constructor stub
	}
}
