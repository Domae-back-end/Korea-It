package com.model;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class MemPageDTO {

	Integer page = 1, start, startPage, endPage;
	Integer limit = 8, pageLimit = 4; 
	Integer total;
	String pageKind;
	
	public void init(MemberDTO mdto, Map<String, Integer> map) {
		
		if(mdto.getPageKind()!=null) {
			
			pageKind = mdto.getPageKind().substring(0,1) +"c";
			
			if(pageKind.equals("wc"))
				limit = 5;
			if(pageKind.equals("lc"))
				limit = 6;
		
		}else
			pageKind = "qc";
		
		
		if(mdto.getPage()!=null)
			this.page = mdto.getPage();
		
		start = (page - 1) * limit;
		
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
