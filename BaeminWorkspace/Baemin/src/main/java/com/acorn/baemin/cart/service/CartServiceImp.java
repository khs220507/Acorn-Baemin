package com.acorn.baemin.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.cart.repository.CartRepositoryImp;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;

@Service
public class CartServiceImp implements CartServiceI {

	@Autowired
	CartRepositoryImp rep;

	@Override
	public List<StoreDTO> selectStoreInfo(int menuCode) {
		List<StoreDTO> storeInfo = rep.selectStoreInfo(menuCode);
		return storeInfo;
	}

	@Override
	public List<MenuDTO> selectMenuInfo(int menuCode) {
		List<MenuDTO> menuInfo = rep.selectMenuInfo(menuCode);
		return menuInfo;
	}

	@Override
	public OrderDTO selectOrderInfo(int orderNumber) {
		OrderDTO orderInfo = rep.selectOrderInfo(orderNumber);
		return orderInfo;
	}
}
