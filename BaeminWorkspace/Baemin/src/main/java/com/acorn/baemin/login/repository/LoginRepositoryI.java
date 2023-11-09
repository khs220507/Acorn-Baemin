package com.acorn.baemin.login.repository;

import java.util.List;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;

public interface LoginRepositoryI {
	
	public List<UserDTO> selectAll() throws Exception;
			
	public boolean loginCustomer(String inputId, String inputPw) throws Exception;

	// 로그인
	public String customerlogin();

	// 홈
	public String home();

	// 로그아웃
	public String logout();

	//손님 로그인
	UserDTO login(String userId, String userPw);

	//사장님 로그인
	SellerDTO loginseller(String sellerId, String sellerPw);
	

	
	
	
	
}
