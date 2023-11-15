package com.acorn.baemin.order.service;

import java.util.List;
import java.util.Map;

import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.UserDTO;

public interface UserOrderServiceI {
	
	public List<UserDTO> getUserByCode(int userCode);

}
