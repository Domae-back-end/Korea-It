package com.model;

import lombok.Data;

@Data
public class Menu {

	String url, title;

	public Menu(String url, String title) {
		super();
		this.url = url;
		this.title = title;
	}
	
	public Menu() {
		// TODO Auto-generated constructor stub
	}
}
