package com.acorn.baemin.order.repository;

import java.util.List;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;

public interface UserOrderRepositoryI {
	
	public List<UserDTO> getUserByCode(int userCode);

	public void insertOrder(OrderDTO orderDTO); 
	
}
