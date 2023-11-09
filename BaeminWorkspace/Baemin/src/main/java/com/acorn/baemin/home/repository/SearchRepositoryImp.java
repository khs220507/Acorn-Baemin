package com.acorn.baemin.home.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.StoreDTO;

@Repository
public class SearchRepositoryImp implements SearchRepositoryI{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.acorn.HomeMapper.";
	
	@Override
	public List<StoreDTO> searchStoresAndMenus(String searchTerm) {
		
		return session.selectList(namespace+"searchStoresAndMenus",searchTerm);
	}

}
