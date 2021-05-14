package com.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbMapper {

	List<MovieTimeDTO> movieTime();
	List<MovieInfoDTO> movieInfo();
	
	void insertMovieTime(MovieTimeDTO dto);
	
	MovieInfoDTO findMovie(String movietitle);
	List<MovieInfoDTO> movielist();
	
}
