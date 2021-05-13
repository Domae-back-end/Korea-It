package com.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieInfoDTO {
	Integer m_index,mplaytime,star;
	String movietitle,mdir,mactrs,mcate,mplot,movieimg;
	Date mdate;
	
	MultipartFile file;
}
