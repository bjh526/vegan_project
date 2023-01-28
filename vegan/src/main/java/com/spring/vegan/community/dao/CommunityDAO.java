package com.spring.vegan.community.dao;

import java.util.List;
import java.util.Map;

import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

public interface CommunityDAO {
	// 전체 게시글 데이터
	public Map<String, Object> community();
	// 상세글 데이터
	public Map<String, Object> viewArticle(int c_articleNo);
	// 댓글 추가
	public void comment(ReplyDTO reply);
	// 조회수 컬럼 추가
	public void increaseViews(int c_articleNo);
	// 새글 데이터 추가
	public int insertNewArticle(Map<String, Object> articleMap);
	// 문의 데이터 추가
	public int inquery(Map<String, Object> articleMap);
	// 스크랩수 컬럼 데이터증가
	public int scrap(Map<String, Object> heartMap);
	// 스크랩수 컬럼 데이터 감소
	public int scrapCancel(int c_articleNo);
	// 문의글 상세보기 데이터
	public Map<String, Object> viewInquery(int iq_no);
	// 게시글 데이터 삭제
	public void deleteArticle(int c_articleNo);
	// 댓글 데이터 삭제
	public void deleteReply(int reply_no);
	// 이벤트 일자 보기
	public List<EventDTO> eventDate();
	// 이벤트 데이터 수정
	public void eventUpdate(Map<String, Object> eventMap);
	// 문의 댓글 데이터 추가
	public List<Iq_ReplyDTO> replyInquery(int iq_no);
	// 이벤트 상세글 데이터보기
	public Map<String, Object> viewEvent(int e_no);
	// 비건라이프 전체글 데이터
	public Map<String, Object> recipeMore();
	// 레시피 검색 필터(작성일자, 조회수, 스크랩수, 하트수, 댓글수) 데이터
	public List<CommunityDTO> writeFilter();
	public List<CommunityDTO> viewsFilter();
	public List<CommunityDTO> scrapsFilter();
	public List<CommunityDTO> heartFilter();
	public List<CommunityDTO> reply_cntFilter();
	// 비건라이프 검색 필터(작성일자, 조회수, 스크랩수, 하트수, 댓글수) 데이터
	public List<CommunityDTO> writeFilter2();
	public List<CommunityDTO> viewsFilter2();
	public List<CommunityDTO> scrapsFilter2();
	public List<CommunityDTO> heartFilter2();
	public List<CommunityDTO> reply_cntFilter2();
	// 좋아요수 컬럼 데이터증가
	public int heart(Map<String, Object> heartMap);
	// 좋아요수 컬럼 데이터감소
	public int heartCancel(int c_articleNo);
	// 비건라이프 전체글 데이터
	public Map<String, Object> veganLifeMore();
	// 게시글 데이터 수정
	public void modArticle(Map<String, Object> articleMap);

	

	

	

}
