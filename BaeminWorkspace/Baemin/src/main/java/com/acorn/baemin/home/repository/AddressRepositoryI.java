package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.AddressDTO;

public interface AddressRepositoryI {

	// 회원가입시에 주소테이블에 주소 삽입
	public int insertAddress(AddressDTO addressDTO);
	
	// 주소 변경
	public int updateAddress(AddressDTO addressDTO);
	
	// 1 => 0으로 변경
	public int addressStatusSwitch(AddressDTO addressDTO);
	
	// 주소 조회
	public List<AddressDTO> selectAddress(int userCode);
	
	//  최신주소 탐색 
	public int lastOrderAddressCode(int userCode);
	
	// 주소에 맞는 주소코드 조회 (카카오, 도로명)
	public int getAddressCodeKakao(AddressDTO addressDTO);
	
	// 회원당 주소 개수 조회
	public int selectAddressCount(int userCode);
	
	// 주소코드로 AddressDTO 반환
	public AddressDTO returnAddressDTO(int addressCode);
	
	// 주소 삭제
	public int deleteAddress(int addressCode);
	
}
