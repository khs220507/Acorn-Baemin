package com.acorn.baemin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.domain.KakaoOrderDTO;
import com.acorn.baemin.order.repository.UserOrderRepositoryImp;

@Service
public class UserOrderServiceImp implements UserOrderServiceI{

	@Autowired
	UserOrderRepositoryImp userOrderRepository;

	@Override
	public List<UserDTO> getUserByCode(int userCode) {
		List<UserDTO> userInfo = userOrderRepository.getUserByCode(userCode);
		return userInfo;
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		userOrderRepository.insertOrder(orderDTO);
	}

	@Override
	public OrderDTO getLastOrder() {
		OrderDTO lastOrderDTO = userOrderRepository.getLastOrder();
		return lastOrderDTO;
	}

	@Override
	public void insertKakaoOrder(KakaoOrderDTO kakaoDTO) {
		userOrderRepository.insertKakaoOrder(kakaoDTO);
		
	}
	
	
	

	
}
