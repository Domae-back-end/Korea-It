package com.user.service;

import java.time.chrono.MinguoDate;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.MimgDTO;
import com.model.MovieAction;
import com.model.MovieAction2;
import com.model.MovieInfoDTO;


@Service
public class Movieimg implements MovieAction2{
	
	@Resource
	DbMapper mm;
	
	@Override
	public Object execute(Integer m_index) {

		
		List<MimgDTO> res = mm.pullimg(m_index);
		Iterator<MimgDTO> it = res.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		return res;
	}
	

	
}
