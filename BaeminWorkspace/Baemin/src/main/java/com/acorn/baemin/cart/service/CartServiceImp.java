package com.acorn.baemin.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.cart.repository.CartRepositoryImp;
import com.acorn.baemin.domain.StoreDTO;

@Service
public class CartServiceImp implements CartServiceI {

	@Autowired
	CartRepositoryImp rep;
	
	@Override
	public List<StoreDTO> storeInfo(int menuCode) {
		System.out.println("storeInfo service");
		List<StoreDTO> storeInfo = rep.selectStore(menuCode);
		
		return storeInfo;
	}
	
}
