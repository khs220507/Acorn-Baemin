package com.acorn.baemin.home.repository;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;



public interface ZzimRepositoryI {

	public List<ZzimStoreDTO> zzimSelectAll(int userCode) throws Exception;
	
	public void zzimClear(@RequestBody ZzimDTO Zzim);
	
	public void zzimInsert (ZzimDTO Zzim);
	
	 public int zzimCheck(ZzimDTO Zzim);

	 public int zzimDelete(int userCode, int storeCode) throws Exception;
}
