package com.spring.vegan.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.vegan.member.dto.User_onDTO;
import com.spring.vegan.reservation.service.ReservService;
import com.spring.vegan.resto.dto.RestoDTO;

@Controller
public class ReservControllerImpl  implements ReservController{
	@Autowired
	ReservService reservService;

	@Override
	@RequestMapping(value="/reservation/reservDetail.do", method=RequestMethod.GET)
	public ModelAndView reservDetail(@RequestParam("resto_no") int resto_no, @RequestParam("headCount") int headCount, 
			@RequestParam("reservTime") String reservTime, @RequestParam("reservDate") String reservDate, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		RestoDTO restoList = reservService.getRestoDetail(resto_no);
		
//		HttpSession session = request.getSession();
//		User_onDTO user_on = (User_onDTO) session.getAttribute("user_onDTO");
//		
//		String name = user_on.getU_name();
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("restoList", restoList);
		mav.addObject("headCount", headCount);
		mav.addObject("reservTime", reservTime);
		mav.addObject("reservDate", reservDate);
		return mav;
	}
}
