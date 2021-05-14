package com.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieInfoDTO {
	Integer m_index;
	Integer mplaytime;
	Integer star;
	String movietitle;
	String  mdir;
	String  mactrs;
	String  mcate;
	String  mplot;
	String movieimg;
	String imgurl;
	Date mdate;
	
	MultipartFile file;
}
