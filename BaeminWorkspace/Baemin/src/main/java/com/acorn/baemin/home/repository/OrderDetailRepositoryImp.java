package com.acorn.baemin.home.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OrderDTO;

@Repository
public class OrderDetailRepositoryImp implements OrderDetailRepositoryI{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.acorn.HomeMapper.";

	@Override
	public List<OrderDTO> orderDetailSelect(int orderNumber) {
		return session.selectList(namespace+"orderDetailSelect",orderNumber);
	}

	@Override
	public int orderDetailDelete(int orderNumber) {
	
		return session.delete(namespace+"orderDelete", orderNumber);
	}
	
	

}
