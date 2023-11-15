package com.acorn.baemin.login.repository;

import java.util.List;
import java.util.Map;

import javax.swing.Spring;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;

@Repository
public class LoginRepository implements LoginRepositoryI {

	@Autowired
	private SqlSession session;

	@Autowired
	private static String namespace = "com.acorn.LoginMapper.";
	 
		@Override
	    public String findCustomerId(Map<String, Object> params) {
	        return session.selectOne("com.acorn.LoginMapper.findCustomerId", params);
	    }

	    @Override
	    public String findSellerId(Map<String, Object> params) {
	        return session.selectOne("com.acorn.LoginMapper.findSellerId", params);
	    }
	
	
	
//	// 유저 아이디 찾기
//	@Override
//    public String findCustomerId(Map<String, Object> params) {
//        return session.selectOne(namespace + "findCustomerId", params);
//    }
//    @Override
//    public String findSellerId(Map<String, Object> params) {
//        return session.selectOne(namespace + "findSellerId", params);
//    }
    
   
	
	
	// 손님 로그인
	@Override
	public UserDTO login(String userId, String userPw) {
		System.out.println(userId + userPw);
		UserDTO user = new UserDTO();
		user.setUserId(userId);
		user.setUserPw(userPw);
		System.out.println("select" + user);
		UserDTO result = session.selectOne(namespace + "selectUserById", user);
		System.out.println("result" + result);

		return result;
	}

	// 사장님 로그인
	@Override
	public SellerDTO loginseller(String sellerId, String sellerPw) {
		System.out.println(sellerId + sellerPw);
		SellerDTO seller = new SellerDTO();
		seller.setSellerId(sellerId);
		seller.setSellerPw(sellerPw);
		System.out.println("select" + seller);
		SellerDTO result2 = session.selectOne(namespace + "selectSellerById", seller);
		System.out.println("result" + result2);
		return result2;
	}

	//

	// 전체조회
	@Override
	public List<UserDTO> selectAll() throws Exception {
		System.out.println("good");
		return session.selectList(namespace + "selectAll");
	}

	// 로그인 여부 확인
	@Override
	public boolean loginCustomer(String inputId, String inputPw) {
		return true;
	}

	// 소비자 로그인
	@Override
	public String customerlogin() {
		// TODO Auto-generated method stub
		return null;
	}

	// 로그아웃
	@Override
	public String logout() {
		// TODO Auto-generated method stub
		return null;
	}

	// 아이디, 비번 찾기
	@Override
	public UserDTO findUserById(String userId) {
		return session.selectOne("com.acorn.mapper.LoginMapper.findUserById", userId);
	}

	@Override
	public UserDTO findUserByEmail(String userEmail) {
		return session.selectOne("com.acorn.mapper.LoginMapper.findUserByEmail", userEmail);
	}

	@Override
	public void updatePassword(UserDTO user) {
		session.update("com.acorn.mapper.LoginMapper.updatePassword", user);
	}

}
