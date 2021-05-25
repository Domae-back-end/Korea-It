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
	Integer noticeindex; //auto번호//
	String noticecate; //구분(시스템, 영화관, 기타)
	String noticetitle; //제목
	String noticecont; //내용
	Date noticetime; //등록일
	Integer noticeview = 0; //조회수
	
	public String getNoticecontBr() {
		return noticecont.replaceAll("\n", "<br>");
	}
	
	public String getNoticecateKr() {
		
		switch (noticecate) {
			case "system": System.out.println("시스템");
			return "시스템";
			case "movie": System.out.println("영화관");
			return "영화관";
			case "etc": System.out.println("기타");
			return "기타";
		}
		return null;
	}
	
	
	
	//1대1문의, 상담내역확인. 
	Integer persindex; //auto번호
	String perscate; //문의유형(일반문의, 영화정보, 회원, 예매, 분실물, 제안/건의)
	String persid; //아이디(회원)
	String perstitle; //제목
	String perscont; //내용
	String persimg; //사진
	MultipartFile file; //사진실제데이터
	Date persqtime; //등록일
	String persacont; //답변칸
	Date persatime; //답변시간
	String persstate; //답변상태
	
	public String getPerscontBr() {
		return perscont.replaceAll("\n", "<br>");
	}
	public String getPersacontBr() {
		return persacont.replaceAll("\n", "<br>");
	}
	
	public String getPerscateKr() {

		switch (perscate) {
			case "basic": System.out.println("일반문의");
			return "일반문의";
			case "movinfo": System.out.println("영화정보");
			return "영화정보";
			case "member": System.out.println("회원");
			return "회원";
			case "ticket": System.out.println("예매");
			return "예매";
			case "lost": System.out.println("분실물");
			return "분실물";
			case "suggest": System.out.println("제안/건의");
			return "제안/건의";
		}
		return null;
	}
	
	//자주묻는질문. 
	int bqindex; //auto번호
	String bqcate; //카테고리(전체, 영화/예매, 가입, 영화관, 기타)
	String bqtitle; //제목
	String bqcont; //내용
	String faqurl1;
	String faqurl2;
	
	
	
	
	
}
