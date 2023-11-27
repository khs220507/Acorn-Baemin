package com.acorn.baemin.selectstrore.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.acorn.baemin.domain.StoreDTO;
@Repository
public class SelectStoreRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.StoreMapper.";
	
	    public List<StoreDTO> selectStore(String storeCategory) {
	    	return session.selectList(namespaceStore+"selectStore",storeCategory);
	    }
	    
	    public void upReviewCountAndStoreRating(StoreDTO store) {
	    	session.selectList(namespaceStore+"upReviewCountAndStoreRating",store);
	    }
}