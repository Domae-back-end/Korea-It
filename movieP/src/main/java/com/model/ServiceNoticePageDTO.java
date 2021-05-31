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
	Integer start; // 1일때 3(limit), 2일때 6(limit*2)
	Integer limit = 10; // 한페이지에 게시글 갯수
	Integer pageLimit = 4; // 밑에페이지번호 갯수 (1창에 4개만)
	Integer total; // 걍 총글의 갯수
	Integer startPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
	Integer endPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
	Integer ttt;
	String tablename;
	
	
	
	
	
	
	public void init(DbMapper dm, HashMap<String, Object> map) {
		// 게시판페이지계산.
		limit = 20; 
		start = (page - 1) * limit;

		ttt = dm.noticetotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		//
		System.out.println("토탈cnt"+ttt);
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
		int ttt = dm.aaatotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		// 이 맵에 들어오는거.totalmap // tablename도 먹여줄수있음.
		/*
		 * 	totalmap.put("pDTO", npDTO);
		totalmap.put("mDTO", mdto);
		 * 
		 * */
		this.total = ttt / limit;
		System.out.println("ttt 몇개"+ttt);
		if (ttt % limit > 0) {
			total++;
		}
		start = (page - 1) * limit;
		startPage = (page - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if (endPage > total) {
			endPage = total;
		}
		System.out.println("faqINIT현재페이지:"+page + ",검색된첫 " + start + ", " + limit + ", " + pageLimit +
				",총페이지수:"  + total + ", "
				+ startPage + ", " + endPage);
	}
	
	public void initpers(DbMapper dm, HashMap<String, Object> map) { //심화(카테고리별)
		limit = 20;
		// 게시판페이지계산.
		start = (page - 1) * limit;

//		ttt = dm.perstotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		ttt = dm.perstotalansCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		//
		System.out.println("토탈cnt"+ttt);
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
	
	public void initpers2(DbMapper dm, HashMap<String, Object> map) { //기본
		// 게시판페이지계산.
		limit = 20; 
		start = (page - 1) * limit;

		ttt = dm.perstotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
//		ttt = dm.perstotalansCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		//
		System.out.println("토탈cnt"+ttt);
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
	
	
	
	public void initpershistory(DbMapper dm, HashMap<String, Object> map) {//내역확인
		limit = 5; 
		start = (page - 1) * limit;
		
		ttt = dm.pershistoryCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		
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
	
	
	
	public void initnoticecate(DbMapper dm, HashMap<String, Object> map) { //심화(공지사항 카테고리)
		limit = 20; 
		start = (page - 1) * limit;

//		ttt = dm.perstotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		ttt = dm.noticecatetotalCnt(map); // 총갯수정함. 페이지나눠야하니깐.
		//
		System.out.println("토탈cnt"+ttt);
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
}
