package com.acorn.baemin.sellerhome.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.acorn.baemin.domain.StoreDTO;

@Repository
public class SellerHomeRepository implements SellerHomeRepositoryI  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.StoreMapper.";
	    
	    @Override
	    public List<StoreDTO> sellerStore(String sellerCode) {
	    	return session.selectList(namespaceStore+"sellerStore",sellerCode);
	    }
	    
	    @Override
	    public void insertStore (StoreDTO store) {
	    	session.insert(namespaceStore+"insertStore", store);
	    }
	   
	    @Override
	    public void deleteStore (StoreDTO store) {
	    	session.insert(namespaceStore+"deleteStore", store);
	    }
	    
	    @Override
	    public StoreDTO updateSellerStore(String storeCode) {
	    	return session.selectOne(namespaceStore+"updateSellerStore",storeCode);
	    }
	    
	    @Override
	    public void updateStore (StoreDTO store) {
	    	session.insert(namespaceStore+"updateStore", store);
	    }
	    
	    



}