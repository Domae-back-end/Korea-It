package com.model;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class MemPageDTO {

	Integer page = 1, cpage = 1, start, cstart, startPage, endPage, cstartPage, cendPage;
	Integer limit = 8, climit = 2, pageLimit = 4; 
	Integer total, ctotal;
	String pageKind;
	
	public void init(MemberDTO mdto, Map<String, Integer> map) {

		if(mdto.getPageKind().equals("mypurchase")) {
			
			pageKind ="sc";
			limit=2;
		
		}else if(mdto.getPageKind()!=null) {
			
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
	
	
	public void cancelinit(MemberDTO mdto, Map<String, Integer> map) {
		
		if(mdto.getCpage()!=null)
			this.cpage = mdto.getCpage();
		
		cstart = (cpage - 1) * climit;
		
		Integer ttt = Integer.parseInt(String.valueOf(map.get("cc")));
		
		this.ctotal = ttt / climit;
		
		if (ttt % climit > 0) {
			ctotal++;
		}
		
		cstartPage = (cpage - 1) / pageLimit * pageLimit + 1;
		cendPage = cstartPage + pageLimit - 1;
		
		if (cendPage > ctotal) {
			cendPage = ctotal;
		}
	}
	
	
}
