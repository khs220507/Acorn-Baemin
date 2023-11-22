package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.AddressDTO;

public interface AddressRepositoryI {

	// 회원가입시에 주소테이블에 주소 삽입
	public int insertAddress(AddressDTO addressDTO);
	
	// 주소 변경
	public int updateAddress(AddressDTO addressDTO);
	
	// 주소 조회
	public List<AddressDTO> selectAddress(int userCode);
	
	// 주소코드 조회
	public int selectAddressCode(int userCode);
	
	// 주소 삭제
	public int deleteAddress(int addressCode);
	
}
