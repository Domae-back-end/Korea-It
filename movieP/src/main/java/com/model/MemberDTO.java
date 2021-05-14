package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	String userid, userpw , username , userpnum, useremail;
	Date userbirth, joinday;
	int userpoint;
	
}
