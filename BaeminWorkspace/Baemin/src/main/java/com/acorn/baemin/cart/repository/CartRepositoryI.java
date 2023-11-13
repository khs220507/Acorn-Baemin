package com.acorn.baemin.cart.repository;

import java.util.List;


import com.acorn.baemin.domain.StoreDTO;

public interface CartRepositoryI {
	public List<StoreDTO> selectStore(int menuCode);
}
