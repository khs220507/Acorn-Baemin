package com.acorn.baemin.home.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;



@Repository
public class ZzimRepositoryImp implements ZzimRepositoryI{

	@Autowired
    private SqlSession session;
 	
    private static String namespace = "com.acorn.HomeMapper.";
    
    
    // 찜 조회
    public List<ZzimStoreDTO> zzimSelectAll(int userCode) throws Exception {
    	System.out.println("zzimList show");
        return session.selectList(namespace+"zzimSelectAll",userCode);
    }

    // 찜 삭제
	@Override
	public int zzimDelete(int userCode, int storeCode) throws Exception {
		ZzimStoreDTO dto = new ZzimStoreDTO();
		dto.setUserCode(userCode);
		dto.setStoreCode(storeCode);
		return session.delete(namespace+"zzimDelete",dto); 
	}
	
	// 찜 추가
    public void zzimInsert (ZzimDTO Zzim) {
    	session.insert(namespace+"zzimInsert", Zzim);
    }
    
    // 찜 유무
    
    public ZzimDTO zzimCheck(ZzimDTO Zzim) {
        return session.selectOne(namespace+"zzimCheck",Zzim);
    }
	
}
