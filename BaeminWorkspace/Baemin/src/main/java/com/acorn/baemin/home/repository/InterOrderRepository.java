package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.OrderDTO;



public interface InterOrderRepository {

	// 주문내역 조회
	public List<OrderDTO> orderSelectAll(int userCode);
	
	// 주문내역 삭제
	public int orderDelete(int orderNumber);

	///////////////////////////////////////////////////////////////////////////////////

	// 상세주문내역 조회
	//public List<OrderDTO> orderDetailSelect(int orderNumber); // 해시맵??? 사용해보기
	
}
