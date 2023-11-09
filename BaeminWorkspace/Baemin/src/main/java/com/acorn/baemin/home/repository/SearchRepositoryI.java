package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.StoreDTO;

public interface SearchRepositoryI {
	
	public List<StoreDTO> searchStoresAndMenus(String searchTerm);
}
