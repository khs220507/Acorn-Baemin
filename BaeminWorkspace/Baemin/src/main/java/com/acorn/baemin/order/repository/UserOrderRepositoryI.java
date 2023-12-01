package com.acorn.baemin.order.repository;

import java.util.List;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.domain.KakaoOrderDTO;

public interface UserOrderRepositoryI {
	
	public List<UserDTO> getUserByCode(int userCode);

	public void insertOrder(OrderDTO orderDTO); 
	
	public OrderDTO getLastOrder();
	
	public void insertKakaoOrder(KakaoOrderDTO kakaoDTO);
	
	
}
