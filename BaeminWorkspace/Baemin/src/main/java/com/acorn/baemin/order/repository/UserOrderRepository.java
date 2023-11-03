package com.acorn.baemin.order.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.UserDTO;



@Repository
public class UserOrderRepository {
	@Autowired
	private SqlSession session;

	private static String namespace = "com.acorn.UserOrderMapper.";

	public List<UserDTO> selectUser(String id) {
		return session.selectList(namespace + "selectUser", id);
	}
}
