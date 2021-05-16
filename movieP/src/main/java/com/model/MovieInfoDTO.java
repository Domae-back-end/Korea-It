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
	//String moviedate;
	
	Date mdate;//(mdate 2021-05-11 꼴로 날라옴.)

	int length;
	
	MultipartFile file;
	MultipartFile[] infoimg;
	
<<<<<<< HEAD
	
	public void setMoviedate(String datevalue){
		System.out.println(datevalue);
		String[] arr= datevalue.split("-");
		mdate= new Date(Integer.parseInt(arr[0])-1900, Integer.parseInt(arr[1])-1,Integer.parseInt(arr[2]));		
	}
	
	
=======
>>>>>>> branch 'master' of https://github.com/Final-Project12354/movieProj.git
}
