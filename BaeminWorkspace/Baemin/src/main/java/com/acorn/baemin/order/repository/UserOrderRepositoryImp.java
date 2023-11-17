package com.acorn.baemin.order.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;



@Repository
public class UserOrderRepositoryImp implements UserOrderRepositoryI {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.acorn.baemin.UserOrderMapper.";
	
	@Override
	public List<UserDTO> getUserByCode(int userCode) {
		System.out.println("test01 : " + userCode);
		return session.selectList(namespace + "getUserByCode", userCode);
	}
	
	public void insertOrder(OrderDTO orderDTO) {
		session.insert(namespace + "insertOrder", orderDTO);
	}
}
