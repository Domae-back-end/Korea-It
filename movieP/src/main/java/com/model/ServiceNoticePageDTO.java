package com.model;

import java.util.HashMap;

import lombok.Data;

@Data
public class ServiceNoticePageDTO {

//	Integer page = 1;		//내가누른 페이지번호
//	Integer cnt = 0;
//	Integer start;			//1일때 3(limit), 2일때 6(limit*2)
//	Integer limit = 3; 		//한페이지에 게시글 갯수
//	Integer pageLimit = 4; 	//밑에페이지번호 갯수 (1창에 4개만)
//	Integer total;			//걍 총글의 갯수
//	Integer startPage;		//pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
//	Integer endPage;		//pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)

	Integer page = 1; // 내가누른 페이지번호
	Integer cnt = 0;
	Integer start; // 1일때 3(limit), 2일때 6(limit*2)
	Integer limit = 5; // 한페이지에 게시글 갯수
	Integer pageLimit = 4; // 밑에페이지번호 갯수 (1창에 4개만)
	Integer total; // 걍 총글의 갯수
	Integer startPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
	Integer endPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)

	
	
	
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
		
		if (cnt == null) {
			this.cnt = 0;
		}
	}
	
	
	
	
	public void init(DbMapper dm, HashMap<String, Object> map) {
		start = (page - 1) * limit;

		int ttt = dm.totalCnt(map); // 총갯수정함. 페이지나눠야하니깐.

		this.total = ttt / limit;

		if (ttt % limit > 0) {
			total++;
		}

//		페이지가정해지면 스타트가정해짐
		start = (page - 1) * limit;

		startPage = (page - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;

		if (endPage > total) {
			endPage = total;
		}

		System.out.println(page + ", " + start + ", " + limit + ", " + pageLimit + ", " + total + ", " + startPage
				+ ", " + endPage);
	}


	public void initfaq(DbMapper dm, HashMap<String, Object> map) {
		start = (page - 1) * limit;
		int ttt = dm.faqtotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		this.total = ttt / limit;
		if (ttt % limit > 0) {
			total++;
		}
		start = (page - 1) * limit;
		startPage = (page - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > total) {
			endPage = total;
		}
		System.out.println("faqINIT"+page + ",검색된첫 " + start + ", " + limit + ", " + pageLimit + ",총검색결과수 " + total + ", "
				+ startPage + ", " + endPage);
	}
}
