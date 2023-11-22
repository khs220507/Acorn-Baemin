package com.acorn.baemin.cart.repository;

import java.util.List;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;

public interface CartRepositoryI {
	public List<StoreDTO> selectStoreInfo(int menuCode);
	public List<MenuDTO> selectMenuInfo(int menuCode);
	public OrderDTO selectOrderInfo(int orderNumber);
	
}
