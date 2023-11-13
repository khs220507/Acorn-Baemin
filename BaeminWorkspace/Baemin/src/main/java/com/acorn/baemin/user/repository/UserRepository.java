package com.acorn.baemin.user.repository;

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
		    if (userType ==1) {
		        return session.selectOne(namespace + "selectCustomerInfo", userCode);
		    } else if (userType ==2) {
		        return session.selectOne(namespace + "selectSellerInfo", userCode);
		    } else {
		        throw new IllegalArgumentException("Invalid userType");
		    }
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

	// 아이디 중복 확인
	@Override
	public int checkDuplicateUserId(UserDTO userDTO) {			   
	return session.selectOne(namespace + "idCheck", userDTO);
	}

	
}
