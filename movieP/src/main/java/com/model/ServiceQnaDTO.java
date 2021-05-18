package com.model;

import lombok.Data;

@Data
public class ServiceQnaDTO {

	//자주묻는질문. 
	
	//int bqindex auto번호
	String bqcate; //카테고리(전체, 영화/예매, 가입, 영화관, 기타)
	String bqtitle; //제목
	String bqcont; //내용

}
