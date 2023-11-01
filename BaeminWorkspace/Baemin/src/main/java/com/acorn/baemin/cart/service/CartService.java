package com.acorn.baemin.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.acorn.baemin.cart.repository.CartRepository;
import com.acorn.baemin.domain.CartDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.domain.StoreDTO;


@Component
public class CartService implements CartServiceI {

	@Autowired
	CartRepository cartRepository;

	@Override
	public Map<String, List> cartList(String id) {
		Map<String , List> cartMap= new HashMap<String , List> ();
		List<CartDTO> cartList = cartRepository.selectCart(id);
		List<StoreDTO> storeList = cartRepository.selectStore(cartList);
		List<MenuDTO> menuList = cartRepository.selectMenu(cartList);
		List<OptionDTO> optionList = cartRepository.selectOption(cartList);
		cartMap.put("cartList", cartList);
		cartMap.put("storeList" , storeList);
		cartMap.put("menuList" , menuList);
		cartMap.put("optionList" , optionList);
		return cartMap;
	}

}
