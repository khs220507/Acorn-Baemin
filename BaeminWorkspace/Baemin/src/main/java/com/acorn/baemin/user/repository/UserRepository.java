package com.acorn.baemin.user.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;

@Repository
public class UserRepository implements UserRepositoryI {

	@Autowired
	private SqlSession session;

	@Autowired
	private static String namespace = "com.acorn.LoginMapper.";

	// 사용자 정보 조회 (손님 및 사장님)
	@Override
	public Object selectUserInfo(Integer userCode, Integer userType) throws Exception {
		if (userType == 1) {
			return session.selectOne(namespace + "selectCustomerInfo", userCode);
		} else if (userType == 2) {
			
			System.out.println("2222 "+ userCode);
			return session.selectOne(namespace + "selectSellerInfo", userCode);
		} else {
			throw new IllegalArgumentException("Invalid userType");
		}
	}
	@Override
	public String getPasswordByUserId(String userId) {
		return session.selectOne(namespace + "getPasswordByUserId", userId);
	}

	// 손님 일부 조회
	@Override
	public UserDTO selectCustomerInfo(String selone) throws Exception {
		return session.selectOne(namespace + "selectCustomerInfo", selone);
	}

	// 사장님 일부 조회
	@Override
	public SellerDTO selectSellerInfo(String selone2) throws Exception {
		return session.selectOne(namespace + "selectSellerInfo", selone2);
	}

	// 손님 회원 가입
	@Override
	public void insertCustomer(UserDTO insertcustomer) {
		session.insert(namespace + "customerSignup", insertcustomer);
	}

	// 사장님 회원 가입
	@Override
	public void insertSeller(SellerDTO insertseller) {
		session.insert(namespace + "sellerSignup", insertseller);
	}

	// 손님 정보 수정
	@Override
	public void updateCustomer(UserDTO updatecustomer) {

		System.out.println(updatecustomer);
		session.update(namespace + "updateInfoCustomer", updatecustomer);
	}

	// 사장님 정보 수정
	@Override
	public void updateSeller(SellerDTO updateseller) {
		session.update(namespace + "updateInfoSeller", updateseller);
	}

	// 손님 아이디 중복 확인
	@Override
	public int checkDuplicateUserId(String userId) {
		return session.selectOne(namespace + "idCheck", userId);
	}

	// 사장님 아이디 중복 확인
	@Override
	public int checkDuplicateUserId2(String sellerId) {
		return session.selectOne(namespace + "idCheck2", sellerId);
	}

	// 손님 닉네임, 연락처, 이메일 중복 확인
	@Override
	public Map<String, Long> checkForDuplicates(@Param("nickname") String nickname, @Param("phone") String phone,
			@Param("email") String email) {
		Map<String, String> params = new HashMap<>();
		params.put("nickname", nickname);
		params.put("phone", phone);
		params.put("email", email);

		return session.selectOne(namespace + "checkForDuplicates", params);
	}

	

}