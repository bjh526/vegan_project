package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 게시글 좋아요 dto
@Component("com_heartDTO")
public class Com_HeartDTO {
	private String u_email; // 이메일 유저테이블의 fk
	private int c_articleNo; // 글번호 게시글테이블의 fk
	private Date com_heart_date; // 좋아요일자
	private String show; // 게시여부
	
	public Date getCom_heart_date() {
		return com_heart_date;
	}
	public void setCom_heart_date(Date com_heart_date) {
		this.com_heart_date = com_heart_date;
	}
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
	
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
}
