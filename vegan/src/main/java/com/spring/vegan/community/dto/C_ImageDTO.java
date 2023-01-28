package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 게시글 이미지 dto
@Component("c_imageDTO")
public class C_ImageDTO {
	private int c_imageNo; // pk 이미지번호
	private String c_image; // 이미지이름
	private Date regDate; // 이미지등록일자
	private int c_articleNo; // 게시글번호 게시글테이블fk
	public int getC_imageNo() {
		return c_imageNo;
	}
	public void setC_imageNo(int c_imageNo) {
		this.c_imageNo = c_imageNo;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getC_articleNo() {
		return c_articleNo;
	}
	public void setC_articleNo(int c_articleNo) {
		this.c_articleNo = c_articleNo;
	}
}
