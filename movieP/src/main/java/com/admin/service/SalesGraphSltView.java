package com.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.SalesDTO;
import com.model.TimeVO;

@Service
public class SalesGraphSltView implements SalesService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {// AJAX Service
		// 재료
		Map<String, String> json = (HashMap<String, String>) obj;
		System.out.println(
				json.get("startyear") + json.get("startmonth") + "~~" + json.get("endyear") + json.get("endmonth"));
		System.out.println(json.get("BtnType") + " :: " + json.get("sectorNo"));

		TimeVO timevo = new TimeVO(Integer.parseInt(json.get("startyear")), Integer.parseInt(json.get("startmonth")),
				Integer.parseInt(json.get("endyear")), Integer.parseInt(json.get("endmonth")),  json.get("sectorNo")   );

		System.out.println(timevo);

		int type = Integer.parseInt((String) json.get("BtnType"));
		System.out.println("버튼넘버" + type);
		List<SalesDTO> res = new ArrayList<SalesDTO>();
		
		
		switch (type) {
		case 1:
		res = db.getMonthlygraph1(timevo);

			break;

		case 2: 
				if(timevo.getSectorNo().equals("관 전체")) {
				res=db.getMonthlygraph4(timevo);}else {
					res=db.getMonthlygraph2(timevo);
				}
		
		

			break;
		case 3:res = db.getMonthlygraph3(timevo);

			break;

		default: 

			break;
		}

		System.out.println("몇개나오는가" + res.size());

		// 반환
		LinkedHashMap<String, Object> result = new LinkedHashMap<String, Object>();

		result.put("answer", "no");

		if (res.size() > 0) {
			result.put("answer", "yes");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

			for (SalesDTO ss : res) {
				result.put(sdf.format(ss.getMonthdate()) + "-" + ss.getSectorNo(), ss.getSumall());
				// System.out.println(res.indexOf(ss)+","+sdf.format(ss.getMonthdate())+"-"+ss.getSectorNo());
			}
		}

		System.out.println(result.size());

		return result;
	}

}
