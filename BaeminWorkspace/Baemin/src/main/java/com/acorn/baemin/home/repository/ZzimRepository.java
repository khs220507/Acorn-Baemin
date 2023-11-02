package com.acorn.baemin.home.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.ZzimStoreDTO;



@Repository
public class ZzimRepository implements InterZzimRepository{

	@Autowired
    private SqlSession session;
 	
    private static String namespace = "com.acorn.HomeMapper.";
    
    public List<ZzimStoreDTO> zzimSelectAll(int userCode) throws Exception {
    	System.out.println("zzimList show");
        return session.selectList(namespace+"zzimSelectAll",userCode);
    }

	@Override
	public int zzimDelete(int userCode, int storeCode) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
    

 
	
}
