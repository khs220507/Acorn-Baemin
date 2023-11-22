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

	// 주소 조회
	@Override
	public List<AddressDTO> selectAddress(int userCode) {
		return session.selectList(namespace + "selectAddress", userCode);
	}
	
	// 주소코드 조회
	@Override
	public int selectAddressCode(int userCode) {
		return session.selectOne(namespace + "selectAddressCode", userCode);
	}

	// 주소 삭제
	@Override
	public int deleteAddress(int addressCode) {
		return session.delete(namespace + "deleteAddress" , addressCode);
	}


}
