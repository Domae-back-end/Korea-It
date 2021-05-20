package com.model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class InitData { // 서버 시작시에 // 자주쓰는 주소들이나. 정보들을 스태틱 힙에 올려놓는다.

	public final static String path(HttpServletRequest request) {
		// 흐스 리퀘스트 받는 path.
		// 파이널까지 걸어버리는 것이 맞아요. 다른데서 함부0로 바꾸면 안되게쬬.
		String path = request.getRealPath("up");
		path="";

		path = "C:\\Users\\unoes\\Documents\\s\\webWork\\mvcProj\\WebContent\\up";

		return path;

	}

	// init data 필요한 사연 >> 어디서나 쓰는 path. 어디서나 공통적으로 쓰는 fileDelete 스태틱으로 두는게 어뗘?

	
	
	
	
	// 파일삭제
	public final static void fileDelete(HttpServletRequest request, String fname,String foldername) {
		if (fname != null) { // 이러면 .. 뒤도 안보고 다삭제.

			Object dto = new Object();// 삭제할떄는 비번이랑. 지울 대상 id 번호만 알면 장떙임.
			//dto.setId(request.getParameter("id"));
			//dto.setPw(request.getParameter("pw"));
			
			new File(path(request) + "\\" + fname).delete();// 주소 링크 뒤져와서 잡아지워.
			//  "\\" 이거 없음ㄴ... path를 지워버리것지.. 클날뻔.
			// 실제 삭제작업을 윈도우에게 정확! 하게 진행하도록 한다. 
			// 장난질 방지.
			
			
			
			
		}

	}
	
	public final static ArrayList<Menu> getSubmenusbyCateName(String cate) {

		HashMap<String, ArrayList<Menu>>map = new HashMap<>();

		map.put("sales", new ArrayList<Menu>());
		map.get("sales").add(new Menu("main","매출보기"));
		map.get("sales").add(new Menu("graph","그래프로조회"));
		map.get("sales").add(new Menu("","추가가능"));
		
		map.put("pageedit", new ArrayList<Menu>());		
		map.get("pageedit").add(new Menu("banner","메인베너관리"));
		map.get("pageedit").add(new Menu("noticelist","공지사항/뉴스"));
		map.get("pageedit").add(new Menu("movieinfolist","영화정보관리"));
		map.get("pageedit").add(new Menu("faqlist","자주찾는질문관리"));
		
		
		
		
		return map.get(cate);
	}

}
