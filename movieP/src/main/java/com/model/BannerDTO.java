package com.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BannerDTO {
	String imgurl;
	int bannerindex;
	int delindex;	
	int m_index;
	
	MultipartFile[] ff;
	
	String[] movieindex;
	
	String[] still;
}
