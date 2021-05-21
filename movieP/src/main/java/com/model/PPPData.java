package com.model;

import lombok.Data;

@Data
public class PPPData {
	String cate, service;

	public PPPData(String cate, String service) {
		super();
		this.cate = cate;
		this.service = service;
	}
	
	public PPPData() {}
	
}
