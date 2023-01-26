package com.spring.vegan.reservation.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vegan.resto.dto.RestoDTO;

@Repository
public class ReservDAOImpl implements ReservDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public RestoDTO getRestoDetail(int resto_no) {
		// TODO Auto-generated method stub
		RestoDTO restoList = sqlSession.selectOne("mapper.resto.getRestoDetail", resto_no);
		return restoList;
	}
}
