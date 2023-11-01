package com.acorn.baemin.cart.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.CartDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.domain.StoreDTO;

@Repository
public class CartRepository implements CartRepositoryI {
	@Autowired
	private SqlSession session;

	private static String namespace = "com.acorn.CartMapper.";

	@Override
	public List<CartDTO> selectCart(String id) {
		return session.selectList(namespace + "selectCart", id);
	}

	@Override
	public List<StoreDTO> selectStore(List<CartDTO> cartList) {
		return session.selectList(namespace + "selectStore", cartList);
	}

	@Override
	public List<MenuDTO> selectMenu(List<CartDTO> cartList) {
		return session.selectList(namespace + "selectMenu", cartList);
	}
	
	@Override
	
	public List<OptionDTO> selectOption(List<CartDTO> cartList) {
		return session.selectList(namespace + "selectOption", cartList);
	}

}
