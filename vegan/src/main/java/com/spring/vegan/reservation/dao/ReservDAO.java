package com.spring.vegan.reservation.dao;

import com.spring.vegan.resto.dto.RestoDTO;

public interface ReservDAO {
	public RestoDTO getRestoDetail(int resto_no);

}
