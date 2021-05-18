package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class ServicePersonalDTO {

	//1대1문의, 상담내역확인. 
	
	//int persindex auto번호
	String perscate; //문의유형(일반문의, 영화정보, 회원, 예매, 분실물, 제안/건의)
	String persid; //아이디(회원)
	String perstitle; //제목
	String perscont; //내용
	String persimg; //사진
	Date persqtime; //등록일
	Date persatime; //답변시간
	String persstate; //답변상태

}
