package com.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbMapper {

   List<MovieTimeDTO> movieTime();

   List<MovieInfoDTO> movieInfo();

   List<MovieInfoDTO> movieInfoBefore(String str);

   List<MovieInfoDTO> movieInfoAfter(String str);
   List<MovieInfoDTO> moviebeforsearch(String str);

   // 영화 시간표
   MovieInfoDTO movieDetail(Integer m_index);

   void insertMovieTime(MovieTimeDTO dto);

   MovieInfoDTO findMovie(String movietitle);

   List<MovieTimeDTO> findMovieTime(String movietitle);

   List<MovieInfoDTO> movielist();

   int updatemovielist(MovieTimeDTO dto);

   int deletemovie(MovieTimeDTO dto);
   
   List<MovieTimeDTO> movieTimeCheck(String movietitle);
   List<MovieTimeDTO> movieTimefind(MovieTimeDTO dto);
   
   
   // 게시판 page 이동.
   int noticetotalCnt(HashMap<String, Object> map);

   // 영화정보 list
   List<MovieInfoDTO> movieinfolist(HashMap<String, Object> map);

   // 영화 제목으로 인덱스 Integer뽑아오기.
   Integer getIndexByTitle(String movietitle);

   // 영화정보insert
   List<ActorDTO> findactor(String actorname);

   void movieinfoinsert(MovieInfoDTO dto);

   void actormovieinsert(ActorDTO dto);

   void catemovieinsert(CateDTO dto);

   void movieimgin(MimgDTO dto);

   // 영화당 review
   List<MovieReviewDTO> review(Integer num);
   
   
   //리뷰 저장하기
   Integer reviewinsert(MovieReviewDTO dto);
   //리뷰 삭제하기
   Integer reviewdelete(MovieReviewDTO dto);
   //좋아요 업데이트하기
   Integer likeupdate(LikeDTO dto);
   //영화별 좋아요 수 가져오기(userlikes에서 컬럼 세서 가져옴)
   Integer selectlike(Integer m_index);
   //movieinfo mlike의 값을 변경
   void updatemlike(LikeDTO dto);
   //userlikes에서 해당하는 id의 like 정보 지운다
   void deletelike(LikeDTO dto);
  
   //매출테이블에서 예매인 정보만 가져옴
   List<EndTimeDTO> pullTInfo(MovieReviewDTO dto);
   //관, m_index 가지고 각영화의 끝나는 시간 저장함
   DateDTO pullEndTime(EndTimeDTO dto);
   
   MovieInfoDTO pullmovieinfo(String movietitle);

   List<ActorDTO> pullactor(Integer m_index);

   List<CateDTO> pullcate(Integer m_index);

   List<MimgDTO> pullimg(Integer m_index);

   
   
   
   void memjoin(MemberDTO mdto);

   MemberDTO memlogin(MemberDTO mdto);

   int memModify(MemberDTO mdto);
	
   List<Map<String, String>> memlikeinfor(MemberDTO mdto);
   List<Map<String, String>> memcomment(MemberDTO mdto);
	
   List<Map<String, String>> memfna(MemberDTO mdto);
   List<SalesDTO> mempurchase(HashMap<String, Object> pur);
   
   
   
   

   // 유저메인화면 베너 관리용.
   int deleteBanner(BannerDTO bannerdto);

   void insertBanner(BannerDTO bannerdto);

   int changeBanner(BannerDTO bannerdto);

   List<BannerDTO> selectBanner();

   
   
   
   
   

   //현준 Service C
   
   void insertPersQna(ServiceFullDTO sfDTO); //1대1문의넣기
   
   List<ServiceFullDTO> noticelist(HashMap<String, Object> map); //공지사항보기
   
   void insertNotice(ServiceFullDTO sfDTO); //어드민딴에서 공지 추가하기
   
   ServiceFullDTO noticedetail(ServiceFullDTO sfDTO); //공지사항 디테일보기
   
   void addCount(ServiceFullDTO sfDTO); //주회수 증가
   
   ServiceFullDTO noticeNext(ServiceFullDTO sfDTO); //공지사항 다음글
   
   ServiceFullDTO noticeBefore(ServiceFullDTO sfDTO); //공지사항 이전글
   
   int noticedelete(ServiceFullDTO sfDTO); //공지사항 삭제
   
////   int bbModify (BoardDTO bDTO);
   
   
   
   
   
   
   
   
   
   //매출 관련 
   
   void insertdaysale(SalesDTO saleDTO);
   int updateSSdaily(SalesDTO salesDTO);
   
   
   //매출관련기능 of 관리자. 
   List<SalesDTO> getsalesbyId(String userid);
   List<SalesDTO> getsales(HashMap<String, Object> map);
   List<SalesDTO> getMonthlygraph(TimeVO timeVO);

   List<ServiceFullDTO> getfaq(HashMap<String, Object> map);

   int aaatotalCnt(HashMap<String, Object> map);
   void insertfaq(ServiceFullDTO sfDTO);
   ServiceFullDTO detailfaq(ServiceFullDTO sfDTO);

   int updatepostername(MovieInfoDTO mdto);
   
   //

}