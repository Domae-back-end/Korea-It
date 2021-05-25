package com.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	String birthDay, birthYear, date, qnastate, qnacontent;
	String userid, userpw , username , userpnum, useremail, kind;
	Date userbirth, joinday;
	
	
	public void setUserbirth(String birthDay, String birthYear) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String dd = birthYear + "-" + birthDay;
			
			this.userbirth = sdf.parse(dd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
