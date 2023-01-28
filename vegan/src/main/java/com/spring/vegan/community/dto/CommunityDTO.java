package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 커뮤니티 게시글 dto
@Component("communityDTO")
public class CommunityDTO {
	private int c_articleNo; // 글번호 pk
	private String c_category; // 카테고리
	private String u_email; // 이메일 유저테이블의 fk
	private String c_title; // 제목
	private Date c_writeDate; // 작성일
	private String c_content; // 내용
	private String c_image; // 이미지파일명
	private int c_views; // 조회수
	private int c_scraps; // 스크랩수
	private String c_show; // 게시여부 
	private int heart; // 하트수
	private int reply_cnt; // 댓글수
	
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	private String search_type; // 검색 정렬방식
	private String keyword; // 검색 키워드
	
	
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	private String u_nick;
	
	public String getU_nick() {
		return u_nick;
	}
	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}
	
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public Date getC_writeDate() {
		return c_writeDate;
	}
	public void setC_writeDate(Date c_writeDate) {
		this.c_writeDate = c_writeDate;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public int getC_views() {
		return c_views;
	}
	public void setC_views(int c_views) {
		this.c_views = c_views;
	}
	public int getC_scraps() {
		return c_scraps;
	}
	public void setC_scraps(int c_scraps) {
		this.c_scraps = c_scraps;
	}
	public String getC_show() {
		return c_show;
	}
	public void setC_show(String c_show) {
		this.c_show = c_show;
	}
}
