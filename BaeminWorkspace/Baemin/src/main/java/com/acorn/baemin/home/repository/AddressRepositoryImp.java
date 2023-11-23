package com.acorn.baemin.home.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.AddressDTO;

@Repository
public class AddressRepositoryImp implements AddressRepositoryI{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.acorn.HomeMapper.";
	
	// 주소 삽입
	@Override
	public int insertAddress(AddressDTO addressDTO) {
		return session.insert(namespace + "insertAddress", addressDTO);
	}

	// 주소 변경
	@Override
	public int updateAddress(AddressDTO addressDTO) {
		return session.update(namespace + "updateAddress", addressDTO);
	}

	// 1 => 0으로 변경
	@Override
	public int addressStatusSwitch(AddressDTO addressDTO) {
		return session.update(namespace + "addressStatusSwitch", addressDTO);
	}

	// 0 => 1로 변경
	@Override
	public int AddressToOne(int addressCode) {
		return session.update(namespace + "AddressToOne", addressCode);
	}
	
	// 주소 조회
	@Override
	public List<AddressDTO> selectAddress(int userCode) {
		return session.selectList(namespace + "selectAddress", userCode);
	}

	// 최신주소 탐색 
	@Override
	public int lastOrderAddressCode(int userCode) {
		return session.selectOne(namespace + "lastOrderAddressCode", userCode);
	}
	
	// 주소에 맞는 주소코드 조회 (카카오, 도로명)
	@Override
	public int getAddressCodeKakao(AddressDTO addressDTO) {
		return session.selectOne(namespace + "getAddressCodeKakao", addressDTO);
	}
	
	// 회원당 주소코드 개수 조회
	@Override
	public int selectAddressCount(int userCode) {
		return session.selectOne(namespace + "selectAddressCount", userCode);
	}
	
	// 주소코드로 AddressDTO 반환
	@Override
	public AddressDTO returnAddressDTO(int addressCode) {
		return session.selectOne(namespace + "returnAddressDTO", addressCode);
	}

	// 주소 삭제
	@Override
	public int deleteAddress(int addressCode) {
		return session.delete(namespace + "deleteAddress" , addressCode);
	}

}
