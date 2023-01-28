package com.spring.vegan.community.service;

import java.util.List;
import java.util.Map;

import com.spring.vegan.community.dto.Com_ScrapDTO;
import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;
import com.spring.vegan.member.dto.EventDTO;
import com.spring.vegan.member.dto.Iq_ReplyDTO;

public interface CommunityService {
	// 전체 게시글 보는 로직
	public Map<String, Object> community();
	// 상세글 보는 로직
	public Map<String, Object> viewArticle(int c_articleNo);
	// 댓글 추가 로직
	public void comment(ReplyDTO reply);
	// 게시글 추가 로직
	public int addNewarticle(Map<String, Object> articleMap);
	// 문의글 추가 로직
	public int inquery(Map<String, Object> articleMap);
	// 스크랩 추가 로직
	public int scrap(Map<String, Object> heartMap);
	// 스크랩 제거 로직
	public int scrapCancel(int c_articleNo);
	// 문의글 상세보기 로직
	public Map<String, Object> viewInquery(int iq_no);
	// 게시글 삭제 로직
	public void deleteArticle(int c_articleNo);
	// 댓글 삭제 로직
	public void deleteReply(int reply_no);
	// 이벤트 일자 요청
	public List<EventDTO> eventDate();
	// 이벤트 수정 로직
	public void eventUpdate(Map<String, Object> eventMap);
	// 문의에 답장 추가 로직
	public List<Iq_ReplyDTO> replyInquery(int iq_no);
	// 이벤트 상세보기 로직
	public Map<String, Object> viewEvent(int e_no);
	// 레시글 상세글 보는 로직
	public Map<String, Object> recipeMore();
	// 레시피 검색 필터(작성일자, 조회수, 스크랩수, 하트수, 댓글수) 로직
	public List<CommunityDTO> writeFilter();
	public List<CommunityDTO> viewsFilter();
	public List<CommunityDTO> scrapsFilter();
	public List<CommunityDTO> heartsFilter();
	public List<CommunityDTO> reply_cntFilter();
	// 비건라이프 검색 필터(작성일자, 조회수, 스크랩수, 하트수, 댓글수) 로직
	public List<CommunityDTO> writeFilter2();
	public List<CommunityDTO> viewsFilter2();
	public List<CommunityDTO> scrapsFilter2();
	public List<CommunityDTO> heartsFilter2();
	public List<CommunityDTO> reply_cntFilter2();
	// 좋아요 추가 로직
	public int heart(Map<String, Object> heartMap);
	// 좋아요 제거 로직
	public int heartCancel(int c_articleNo);
	// 비건라이프 상세글 보기 로직
	public Map<String, Object> veganLifeMore();
	// 게시글 수정 로직
	public void modArticle(Map<String, Object> articleMap);

	

	

	

	

	

}
