package com.model;

import java.util.HashMap;

import lombok.Data;
@Data
public class SalesPageDTO {// SalesPageDTO 의 init 주의.
	Integer page = 1; // 내가누른 페이지번호
	Integer start; // 1일때 3(limit), 2일때 6(limit*2)
	Integer limit = 8; // 한페이지에 게시글 갯수
	Integer pageLimit = 5; // 밑에페이지번호 갯수 (1창에 4개만)
	Integer total; // 걍 총글의 갯수
	Integer startPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
	Integer endPage; // pagelimit에 다다르고 그담페이지번호 계산 (1일땐 1~4) (2일땐 5~8)
	Integer ttt;
	String tablename;
	
	
	
	
	//
	
	public void init(DbMapper db, HashMap<String, Object> map) {
		start = (page - 1) * limit;
		
		
		 SalesDTO  sadto= (SalesDTO)map.get("sadto");
		
		if(sadto.getSalesstime()!=null&sadto.getSalesetime()!=null&&sadto.getSalesstime().before(sadto.getSalesetime())) {
		//ttt=db.salestotalCnt2(map);
		ttt=db.salestotalCnt(map);
		}else {
		ttt = db.salestotalCnt(map); }// 총갯수정함. 페이지나눠야하니깐.
		//
		System.out.println("Sales ttt:"+ttt);
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
