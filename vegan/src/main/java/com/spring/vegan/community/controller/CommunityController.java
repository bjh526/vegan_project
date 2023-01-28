package com.spring.vegan.community.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.community.dto.CommunityDTO;
import com.spring.vegan.community.dto.InqueryDTO;
import com.spring.vegan.community.dto.ReplyDTO;

public interface CommunityController {
	// 커뮤니티 메인창 보여주기 
	public ModelAndView community(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글작성 창으로 이동
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글작성 요청
	public ResponseEntity<String> addArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	// 상세글보기
	public ModelAndView viewArticle(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 댓글달기
	public String comment(ReplyDTO reply) throws Exception;
	// 글삭제
	public void deleteArticle(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 댓글삭제
	public void deleteReply(@RequestParam("reply_no") int reply_no, @RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 문의작성 창으로 이동
	public ModelAndView inqueryForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 문의작성 요청
	public ResponseEntity<String> inquery(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	// 스크랩
	public int scrap(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 스크랩취소
	public int scrapCancel(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 이벤트보기
	public ModelAndView viewEvent(@RequestParam("e_no") int e_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 카테고리 레시피 글 따로보는 창으로 이동
	public ModelAndView recipeMore(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 카테고리 비건라이프 글 따로보는 창으로 이동
	public ModelAndView veganLifeMore(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 레시피 게시글 검색 필터링
	public List<CommunityDTO> changeFilter(@RequestParam("search_type") String search_type, Model model) throws Exception;
	// 비건라이프 게시글 검색 필터링
	public List<CommunityDTO> changeFilter2(@RequestParam("search_type") String search_type, Model model) throws Exception;
	// 문의글 보기
	public ModelAndView viewInquery(@RequestParam("iq_no") int iq_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 이벤트 기간 종료시 업데이트
	public void eventUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 좋아요
	public int heart(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 좋아요 취소
	public int heartCancel(@RequestParam("c_articleNo") int c_articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 글수정 모달창 띄우기
	public String modArticle(@RequestParam("c_articleNo") int c_articleNo, @RequestParam("c_title") String c_title, @RequestParam("c_content") String c_content, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
