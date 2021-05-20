package com.model;

import java.util.Date;

import lombok.Data;

@Data
public class ServiceNoticeDTO {

	//공지사항테이블. 
	
	int noticeindex; //auto번호
	String noticecate; //구분(시스템, 영화관, 기타)
	String noticetitle; //제목
	String noticecont; //내용
	Date datetime; //등록일
	int noticeview; //조회수
	
}
