package com.model;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieInfoDTO {
	Integer m_index;
	Integer mplaytime;
	Integer star;
	String movietitle;
	String  mdir;
	String mimg;
	String  mactrs;
	String  mcate;
	String  mplot;
	String movieimg;
	String imgurl;
	String mdate;//(mdate 2021-05-11 꼴로 날라옴.)
	
	int length;
	
	MultipartFile file;
	MultipartFile[] infoimg;
	
	
}
