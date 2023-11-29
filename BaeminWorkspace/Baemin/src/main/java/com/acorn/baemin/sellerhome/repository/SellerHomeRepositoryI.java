package com.acorn.baemin.sellerhome.repository;

import java.util.List;

import com.acorn.baemin.domain.StoreDTO;

public interface SellerHomeRepositoryI {
	
	public List<StoreDTO> sellerStore(String sellerCode);
	
	 public void insertStore (StoreDTO store);
	 
	 public void deleteStore (StoreDTO store);
	 
	 public StoreDTO updateSellerStore(String storeCode);
	 
	 public void updateStore (StoreDTO store);
}
