package com.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbMapper {

	List<MovieTimeDTO> movieTime();
	List<MovieInfoDTO> movieInfo();
	List<MovieInfoDTO> movieInfoBefore();
	List<MovieInfoDTO> movieInfoAfter();
	
	
	MovieInfoDTO movieDetail(Integer m_index);

	void insertMovieTime(MovieTimeDTO dto);

	MovieInfoDTO findMovie(String movietitle);
	List<MovieTimeDTO> findMovieTime(String movietitle);
	List<MovieInfoDTO> movielist();
	
	
	
	//게시판 page 이동.
	int totalCnt(HashMap<String, Object> map);
	
	//영화정보 list 
	List<MovieInfoDTO> movieinfolist(HashMap<String,Object> map);
	
	
	//영화정보insert
	List<ActorDTO> findactor(String actorname);	
	void movieinfoinsert(MovieInfoDTO dto);
	void actormovieinsert(ActorDTO dto);
	void catemovieinsert(CateDTO dto);
	void movieimgin(MimgDTO dto);
	
	MovieInfoDTO pullmovieinfo(String movietitle);	
	
	List<ActorDTO> pullactor(String movietitle);
	List<CateDTO> pullcate(String movietitle);
	List<MimgDTO> pullimg(String movietitle);
	
	List<MemberDTO> meminsert();
	MemberDTO memdetail();
	
	
}
