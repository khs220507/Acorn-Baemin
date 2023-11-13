package com.acorn.baemin.cart.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.StoreDTO;

public class CartRepositoryImp implements CartRepositoryI {
	
	@Autowired
	CartRepositoryImp rep;
	private SqlSession session;
	private static String namespace = "com.acorn.CartMapper.";
	
	@Override
	public List<StoreDTO> selectStore(int menuCode) {
		System.out.println("selectStore repo");
		return session.selectList(namespace + "selectStore", menuCode);
		
	}
}
