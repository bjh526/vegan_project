package com.spring.vegan.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vegan.reservation.dao.ReservDAO;
import com.spring.vegan.resto.dto.RestoDTO;

@Service
public class ReservServiceImpl implements ReservService{
	@Autowired
	ReservDAO reservDAO;

	@Override
	public RestoDTO getRestoDetail(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO restoList = reservDAO.getRestoDetail(resto_no);
		return restoList;
	}
}
