package com.model;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class MemPageDTO {

	Integer page = 1, start, startPage, endPage;
	Integer limit = 6, pageLimit = 4; 
	Integer total;
	
	public void init(MemberDTO mdto, Map<String, Integer> map) {
		
		if(mdto.getPage()!=null)
			this.page = mdto.getPage();
		
		start = (page - 1) * limit;

		String pageKind = mdto.getPageKind().substring(0,1) +"c";
		System.out.println(pageKind);
		Integer ttt = Integer.parseInt(String.valueOf(map.get(pageKind)));
		
		this.total = ttt / limit;

		if (ttt % limit > 0) {
			total++;
		}
		
		startPage = (page - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;

		if (endPage > total) {
			endPage = total;
		}

	}

}
