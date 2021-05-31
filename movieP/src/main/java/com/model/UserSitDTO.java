package com.model;

import lombok.Data;

@Data
public class UserSitDTO {
	Integer t_index,time_index;
	String seatNo,userid,people;
	Integer cnt1,cnt2,cnt3;
	public UserSitDTO(Integer time_index, String seatNo, String userid, String peoString) {
		this.time_index = time_index;
		this.seatNo = seatNo;
		this.userid = userid;
		this.people = peoString;
	}
	
	
	public UserSitDTO() {
	}
}
