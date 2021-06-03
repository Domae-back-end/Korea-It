package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieReviewDTO {
	Integer cnt, gpa;
	String cate, userid, postcontent, movietitle;
	Date posttime;
	String posttime_s;
	
	public String getContentBr() {
		return this.postcontent.replaceAll("\n", "<br>");
	}
}
