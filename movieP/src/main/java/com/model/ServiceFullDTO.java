package com.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ServiceFullDTO {
	
	//유형, 검색어
	String kind2;
	String schkey;//searchkey
	

	//공지사항테이블. 	
	Integer noticeindex; //auto번호
	String noticecate; //구분(시스템, 영화관, 기타)
	String noticetitle; //제목
	String noticecont; //내용
	Date noticetime; //등록일
	Integer noticeview = 0; //조회수
	
	
	
	
	//1대1문의, 상담내역확인. 
	//int persindex auto번호
	String perscate; //문의유형(일반문의, 영화정보, 회원, 예매, 분실물, 제안/건의)
	String persid; //아이디(회원)
	String perstitle; //제목
	String perscont; //내용
	String persimg; //사진
	MultipartFile file; //사진실제데이터
	Date persqtime; //등록일
	Date persatime; //답변시간
	String persstate; //답변상태
	
	
	
	//자주묻는질문. 
	
	int bqindex; //auto번호
	String bqcate; //카테고리(전체, 영화/예매, 가입, 영화관, 기타)
	String bqtitle; //제목
	String bqcont; //내용
	String faqurl1;
	String faqurl2;
	
	
	
	
	
}
