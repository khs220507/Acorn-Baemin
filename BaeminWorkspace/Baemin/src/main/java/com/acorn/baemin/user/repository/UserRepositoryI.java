package com.acorn.baemin.user.repository;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;

public interface UserRepositoryI {

	public UserDTO selectCustomerInfo(String selone) throws Exception;

	public SellerDTO selectSellerInfo(String selone2) throws Exception;	
	
	// 손님 가입
	public void insertCustomer(UserDTO insertcustomer);
		
	// 사장님 가입
	public void insertSeller(SellerDTO insertseller);
	
	// 손님 정보수정
	public void updateCustomer(UserDTO updatecustomer);
	
	// 사장님 정보수정
	public void updateSeller(SellerDTO updateseller);

	// 아이디 중복 확인
		public int checkDuplicateUserId(UserDTO userDTO);
}
