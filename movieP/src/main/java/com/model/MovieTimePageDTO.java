package com.model;

import java.util.HashMap;

import lombok.Data;

@Data
public class MovieTimePageDTO {


	Integer page = 1;
	Integer start, limit = 1, pageLimit = 4, total, startPage, endPage;
	Integer cnt=0;
	Integer ttt;
	
	public void setCnt(Integer cnt) {
		this.cnt=cnt;
		if(cnt==null) {
			this.cnt=0;
		}
	}
	
	public void init(DbMapper dbmap, HashMap<String, Object> map) {
		start = (page-1) * limit;
		
		int ttt = dbmap.totalCnt(map);
		
		this.total = ttt/limit;
		
		if(ttt%limit>0)
			total++;

		start = (page-1)*limit;
		
		startPage = (page-1)/pageLimit * pageLimit  +1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > total) {
			endPage = total;
		}
		
		System.out.println(total+","+startPage+","+endPage+"토탈카운트결과:"+ttt);
		
		
	}
}
