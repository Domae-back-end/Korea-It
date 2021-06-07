package com.admin.service;

import org.springframework.stereotype.Service;

import com.model.MovieTimeDTO;

//영화 시간표 Service
public interface MovieTimeService {
	Object execute(MovieTimeDTO dto);
}
