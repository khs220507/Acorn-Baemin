package com.acorn.baemin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.repository.UserOrderRepository;

@Component
public class UserOrderService implements UserOrderServiceI{

	@Autowired
	UserOrderRepository userOrderRepository;
	
	@Override
	public List<UserDTO> userInfo(String id) {
		List<UserDTO> userInfo = userOrderRepository.selectUser(id);
		return userInfo;
	}
	

	
}
