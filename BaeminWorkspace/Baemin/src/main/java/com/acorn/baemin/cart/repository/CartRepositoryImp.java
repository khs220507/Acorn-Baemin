package com.acorn.baemin.cart.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.StoreDTO;

@Repository
public class CartRepositoryImp implements CartRepositoryI {
	
	
	 
	@Autowired
	private SqlSession session;
	private static String namespace = "com.acorn.CartMapper.";
	
	@Override
	public List<StoreDTO> selectStoreInfo(int menuCode) {		
		return session.selectList(namespace + "selectStoreInfo", menuCode);
		
	}

	@Override
	public List<MenuDTO> selectMenuInfo(int menuCode) {
		return session.selectList(namespace + "selectMenuInfo", menuCode);
		
	}
}
