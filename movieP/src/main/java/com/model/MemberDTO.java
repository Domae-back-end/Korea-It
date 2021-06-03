package com.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	String date, qnastate, qnacontent, like, content, pageKind;
	int index, start, cstart;
	Integer page, cpage, ticket, limit;
	String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	
	String birthDay, birthYear;
	String userid, userpw , username , userpnum, userpnumM, useremail, kind;
	Date userbirth, joinday, userbirthM;
	
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
