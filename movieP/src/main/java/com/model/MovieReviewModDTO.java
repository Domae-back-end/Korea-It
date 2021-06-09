package com.model;

import lombok.Data;

@Data
public class MovieReviewModDTO {
	String rating1;
	String content;
	String postcontent;
	String cnt;
	String userid;
	String cate;
	Integer gpa;
	
	
	public void IntegerRating() {
		this.gpa = Integer.parseInt(rating1);
	}
}
