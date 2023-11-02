package com.acorn.baemin.selectstrore.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.acorn.baemin.domain.StoreDTO;
@Repository
public class SelectStrollerRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.StoreMapper.";
	
	    public List<StoreDTO> selectStore(String storeCategory) {
	    	return session.selectList(namespaceStore+"selectStore",storeCategory);
	    }
	    
//	    public void insertStore (StoreDTO store) {
//	    	session.insert(namespaceStore+"insertStore", store);
//	    }
//	    
//	    public void deleteStore (String storeCode) {
//	    	session.insert(namespaceStore+"deleteStore", storeCode);
//	    }
//	    
//	    public StoreDTO updateSellerStore(String storeCode) {
//	    	return session.selectOne(namespaceStore+"updateSellerStore",storeCode);
//	    }
//	    
//	    public void updateStore (StoreDTO store) {
//	    	session.insert(namespaceStore+"updateStore", store);
//	    }
	    
	    



}