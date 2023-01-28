package com.spring.vegan.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 문의이미지 dto
@Component("iq_imageDTO")
public class Iq_ImageDTO {
	private int iq_imageNo; // 이미지번호pk
	private String iq_image; // 이름
	private Date regDate; // 일자
	private int iq_no; // 문의글번호 문의글테이블 fk
	public int getIq_imageNo() {
		return iq_imageNo;
	}
	public void setIq_imageNo(int iq_imageNo) {
		this.iq_imageNo = iq_imageNo;
	}
	public String getIq_image() {
		return iq_image;
	}
	public void setIq_image(String iq_image) {
		this.iq_image = iq_image;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getIq_no() {
		return iq_no;
	}
	public void setIq_no(int iq_no) {
		this.iq_no = iq_no;
	}
	
}
