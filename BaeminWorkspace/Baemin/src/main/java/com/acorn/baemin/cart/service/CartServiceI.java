package com.acorn.baemin.cart.service;

import java.util.List;

import com.acorn.baemin.domain.StoreDTO;

public interface CartServiceI {
	public List<StoreDTO> storeInfo(int menuCode);
}
