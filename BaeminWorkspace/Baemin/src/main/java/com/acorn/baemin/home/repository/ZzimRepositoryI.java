package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;



public interface ZzimRepositoryI {

	public List<ZzimStoreDTO> zzimSelectAll(int userCode) throws Exception;
	
	public int zzimDelete(int storeCode, int userCode) throws Exception;
}
