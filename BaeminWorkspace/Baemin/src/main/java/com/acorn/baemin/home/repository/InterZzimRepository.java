package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;



public interface InterZzimRepository {

	public List<ZzimStoreDTO> zzimSelectAll(int userCode) throws Exception;
	
	public int zzimDelete(int userCode, int storeCode) throws Exception;
}
