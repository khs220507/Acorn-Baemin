package com.acorn.baemin.option.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OptionDTO;
@Repository
public class OptionRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.OptionMapper.";
	
	    public List<OptionDTO> selectOption(String menuCode) {
	    	return session.selectList(namespaceStore+"selectOption",menuCode);
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