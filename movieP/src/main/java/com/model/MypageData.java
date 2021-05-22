package com.model;

import lombok.Data;

@Data
public class MypageData {

	String cate, service;

	public MypageData(String cate, String service) {
		super();
		this.cate = cate;
		this.service = service;
	}
	
	public MypageData() {}
}
