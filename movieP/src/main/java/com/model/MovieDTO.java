package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class MovieDTO {
	Integer m_index, mplaytime, mstar;
	String movietitle, mdir, mactrs, mcate, mplot, movieimg;
	Date mdate;
	
	
}
