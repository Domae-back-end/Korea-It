package com.model;

import java.sql.Time;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface DbMapper {

	List<MovieTimeDTO> movieTime();
	List<MovieInfoDTO> movieInfo();
	List<MovieInfoDTO> movieInfoBefore(String str);
	List<MovieInfoDTO> movieInfoAfter(String str);
	//List<MovieInfoDTO> moviebeforsearch(String str);

	
	//영화 시간표
	MovieInfoDTO movieDetail(Integer m_index);

	void insertMovieTime(MovieTimeDTO dto);

	MovieInfoDTO findMovie(String movietitle);
	List<MovieTimeDTO> findMovieTime(String movietitle);
	List<MovieInfoDTO> movielist();
	int updatemovielist(MovieTimeDTO dto);
	int deletemovie(MovieTimeDTO dto);
	
	
	//게시판 page 이동.
	int totalCnt(HashMap<String, Object> map);
	
	//영화정보 list 
	List<MovieInfoDTO> movieinfolist(HashMap<String,Object> map);
	
	// 영화 제목으로 인덱스 Integer뽑아오기.
	Integer getIndexByTitle(String movietitle);
	
	//영화정보insert
		List<ActorDTO> findactor(String actorname);	
	void movieinfoinsert(MovieInfoDTO dto);
	void actormovieinsert(ActorDTO dto);
	void catemovieinsert(CateDTO dto);
	void movieimgin(MimgDTO dto);
	
	//영화당 review
	List<MovieReviewDTO> review(Integer num);
	
	MovieInfoDTO pullmovieinfo(String movietitle);	
	
	List<ActorDTO> pullactor(Integer m_index);
	List<CateDTO> pullcate(Integer m_index);
	List<MimgDTO> pullimg(Integer m_index);
	

	
	void memjoin(MemberDTO mdto);
	MemberDTO memlogin(MemberDTO mdto);
	int memModify(MemberDTO mdto);

   // 유저메인화면 베너 관리용.
   int deleteBanner(BannerDTO bannerdto);
   
   void insertBanner(BannerDTO bannerdto);
   
   int changeBanner(BannerDTO bannerdto);
   
   List<BannerDTO> selectBanner();
   

	
	
	
	
	
	//현준 Service C  mapper
	
	void insertPersQna(ServicePersonalDTO persDTO); //1대1문의넣기
	List<ServiceNoticeDTO> noticelist(); //공지사항보기
	
	void insertNotice(ServiceNoticeDTO nDTO); //어드민딴에서 공지 추가하기
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//매출관련기능 of 관리자. 
	
	
	List<SalesDTO> getsales();
	List<SalesDTO> getMonthlygraph(TimeVO timeVO);
	List<ServiceFullDTO> getfaq(HashMap<String, Object> map);
	int faqtotalCnt(HashMap<String,Object> map);
	
}














