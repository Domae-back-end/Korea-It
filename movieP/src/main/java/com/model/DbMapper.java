package com.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbMapper {

	List<MovieTimeDTO> movieTime();
	List<MovieInfoDTO> movieInfo();
	
	void insertMovieTime(MovieTimeDTO dto);

	MovieInfoDTO findMovie(String movietitle);
	List<MovieTimeDTO> findMovieTime(String movietitle);
	List<MovieInfoDTO> movielist();
	
<<<<<<< HEAD
	
	List<ActorDTO> findactor(String actorname);
	
	void movieinfoinsert(MovieInfoDTO dto);
	void actormovieinsert(ActorDTO dto);
	void catemovieinsert(CateDTO dto);
	
	MovieInfoDTO pullmovieinfo(String movietitle);
	
	List<ActorDTO> pullactor(String movietitle);
	List<CateDTO> pullcate(String movietitle);
	
	
	
=======
	List<MemberDTO> meminsert();
	MemberDTO memdetail();
>>>>>>> branch 'master' of https://github.com/Final-Project12354/movieProj.git
	
	
	
}
