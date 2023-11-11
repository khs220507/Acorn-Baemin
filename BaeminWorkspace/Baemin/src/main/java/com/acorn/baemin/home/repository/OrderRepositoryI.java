package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.OrderDTO;



public interface OrderRepositoryI {

	// 주문내역 조회
	public List<OrderDTO> orderSelectAll(int userCode);
	
	// 주문내역 삭제
	public int orderDelete(int orderNumber);

	
}
