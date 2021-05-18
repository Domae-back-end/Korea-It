package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieReviewDTO {
	int cnt;
	String cate, userid, postcontent;
	Date posttime;
	String posttime_s;
}
