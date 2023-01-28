package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 게시글 스크랩 dto
@Component("com_scrapDTO")
public class Com_ScrapDTO {
	private String u_email; // 이메일 유저테이블의 fk
	private int c_articleNo; // 글번호 게시글테이블의 fk
	private Date com_scrap_date; // 스크랩일자
	private String show; // 게시여부
	
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
	public Date getCom_scrap_date() {
		return com_scrap_date;
	}
	public void setCom_scrap_date(Date com_scrap_date) {
		this.com_scrap_date = com_scrap_date;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
}
