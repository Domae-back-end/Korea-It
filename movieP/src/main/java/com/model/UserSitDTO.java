package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserSitDTO {
	Integer t_index,time_index;
	String seatNo,userid,people;
	Integer cnt1,cnt2,cnt3;
	Date reg_date;
	Integer choice;
	
	public UserSitDTO(Integer time_index, String seatNo, String userid, String peoString,Date reg_date) {
		this.time_index = time_index;
		this.seatNo = seatNo;
		this.userid = userid;
		this.people = peoString;
		this.reg_date = reg_date;
	}
	
	
	public UserSitDTO() {
	}
}
