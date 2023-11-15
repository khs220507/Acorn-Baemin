package com.acorn.baemin.cart.service;

import java.util.List;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.StoreDTO;

public interface CartServiceI {
	public List<StoreDTO> selectStoreInfo(int menuCode);
	public List<MenuDTO> selectMenuInfo(int menuCode);
}
