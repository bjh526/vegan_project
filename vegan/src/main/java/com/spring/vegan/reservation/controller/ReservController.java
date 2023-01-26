package com.spring.vegan.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ReservController {
	public ModelAndView reservDetail(@RequestParam("resto_no") int resto_no, @RequestParam("headCount") int headCount, 
			@RequestParam("reservTime") String reservTime, @RequestParam("reservDate") String reservDate,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}