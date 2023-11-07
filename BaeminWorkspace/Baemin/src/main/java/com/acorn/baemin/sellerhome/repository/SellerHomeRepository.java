package com.acorn.baemin.sellerhome.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.StoreInsertDTO;
@Repository
public class SellerHomeRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.StoreMapper.";
	
	    public List<StoreDTO> sellerStore(String sellerCode) {
	    	return session.selectList(namespaceStore+"sellerStore",sellerCode);
	    }
	    
	    public void insertStore (StoreDTO store) {
	    	session.insert(namespaceStore+"insertStore", store);
	    }
	   
	    public void deleteStore (String storeCode) {
	    	session.insert(namespaceStore+"deleteStore", storeCode);
	    }
	    
	    public StoreDTO updateSellerStore(String storeCode) {
	    	return session.selectOne(namespaceStore+"updateSellerStore",storeCode);
	    }
	    
	    public void updateStore (StoreDTO store) {
	    	session.insert(namespaceStore+"updateStore", store);
	    }
	    
	    



}