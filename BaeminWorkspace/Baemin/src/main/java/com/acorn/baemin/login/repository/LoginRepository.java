package com.acorn.baemin.login.repository;

import java.util.List;

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
	
	//�α���
	@Override
	public UserDTO login(String userId, String userPw) {
		UserDTO user = new UserDTO();
		user.setUserId(userId);
		user.setUserPw(userPw);
		UserDTO result = session.selectOne(namespace + "selectUserById", user);
		System.out.println("result" + result);
		return result;
	}
	
	//����� �α���
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
	// ��ü��ȸ
	@Override
	public List<UserDTO> selectAll() throws Exception {
		System.out.println("good");
		return session.selectList(namespace + "selectAll");
	}

	// �α��� ���� Ȯ��
	@Override
	public boolean loginCustomer(String unputId, String inputPw) {
		return true;
	}

	// �Һ��� �α���
	@Override
	public String customerlogin() {
		// TODO Auto-generated method stub
		return null;
	}

	// Ȩ
	@Override
	public String home() {
		// TODO Auto-generated method stub
		return null;
	}	

	// �α׾ƿ�
	@Override
	public String logout() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDTO selectUserCode(String userId) {
		return session.selectOne(namespace + "selectUserCode", userId);
	}
	
	

	

	
	
	

}

