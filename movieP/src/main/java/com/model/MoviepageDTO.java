package com.model;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class MoviepageDTO {
	
	DbMapper mm;
	
	Integer page=1, cnt=0;
	Integer start, limit =10, pageLimit=4, total, startPage, endPage;
	
	
	public void setCnt(Integer cnt) {
		
		this.cnt = cnt;
	
		if(cnt == null) {
			this.cnt = 0;
		}
	}
	
	public void init(DbMapper mm, HashMap<String, Object> map) {
		System.out.println("init 실행");
		start = (page -1 )*limit;
		
		int ttt = mm.totalCnt(map);
		this.total = ttt/limit;
		
		if(ttt % limit>0)
			total++;
		start = (page -1)*limit;

		startPage = (page -1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > total) {
			endPage = total;
		}
		System.out.println(total+","+startPage+","+endPage);
	}
}
