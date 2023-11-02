package com.acorn.baemin.home.repository;

import java.util.List;

import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.UserDTO;

public interface OrderDetailRepositoryI {

	public List<OrderDTO> orderDetailSelect(int orderNumber);
	
	
}
