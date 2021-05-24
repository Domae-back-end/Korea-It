package com.model;

public enum MovieSect {
	SMALL("작은관"),
	SMALL1("작은1관"),
	SMALL2("작은2관"),
	NORM("기존관"),
	NORM1("기존1관"),
	NORM2("기존2관"),
	TD("3D관"),
	TD1("3D1관");
	
	private String sname;
	
	private MovieSect(String sname) {
		this.sname= sname;
	}
	
	public String getSname() {
		return sname;
	}
	public MovieSect pull(String sname) {
		return MovieSect.NORM;
	}
	
	
}
