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

			System.out.println("2222 " + userCode);
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
		session.update(namespace + "updateInfoCustomer", updatecustomer);
	}

	// 사장님 정보 수정
	@Override
	public void updateSeller(SellerDTO updateseller) {
		session.update(namespace + "updateInfoSeller", updateseller);
	}

	// 사장님 회원 탈퇴
	@Override
	public void signoutSeller(int sellerSignOut) {
		session.update(namespace + "signoutseller", sellerSignOut);
	}
	
	// 손님 회원 탈퇴
	@Override
	public void signoutUser(int userSignOut) {
		session.update(namespace + "signoutuser", userSignOut);
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

	// 닉네임 중복 확인
	@Override
	public int checkDuplicateNickname(String userNickname) {
		return session.selectOne(namespace + "nickCheck", userNickname);
	}

	// 손님 연락처 중복 확인
	@Override
	public int checkDuplicateUserphone(String userPhone) {
		return session.selectOne(namespace + "userPhoneCheck", userPhone);
	}

	// 사장님 연락처 중복 확인
	@Override
	public int checkDuplicateSellerphone(String sellerPhone) {
		return session.selectOne(namespace + "sellerPhoneCheck", sellerPhone);
	}

	// 손님 이메일 중복 확인
	@Override
	public int checkDuplicateUseremail(String userEmail) {
		System.out.println("userEmail===>" + userEmail);
		return session.selectOne(namespace + "emailCheck", userEmail);
	}

	// 사장님 이메일 중복 확인
	@Override
	public int checkDuplicateSelleremail(String sellerEmail) {
		System.out.println("sellerEmail===>" + sellerEmail);
		return session.selectOne(namespace + "emailCheck2", sellerEmail);
	}

	// 사업자등록번호 중복 확인
	@Override
	public int checkDuplicateSellerRegCode(String sellerRegCode) {
		return session.selectOne(namespace + "sellerRegCodeCheck", sellerRegCode);
	}

	@Override
	public Map<String, Long> checkForDuplicates(String nickname, String phone, String email) {
		// TODO Auto-generated method stub
		return null;
	}

}