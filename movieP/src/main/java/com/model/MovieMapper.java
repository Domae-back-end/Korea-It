package com.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.model.MovieDTO;

//DAO역할을 하는 곳.
@Mapper
public interface MovieMapper {
	List<MovieDTO> movielist();
}
