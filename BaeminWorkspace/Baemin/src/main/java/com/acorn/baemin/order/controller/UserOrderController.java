package com.acorn.baemin.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.repository.UserOrderRepository;
import com.acorn.baemin.order.service.UserOrderService;

@Controller
public class UserOrderController {

	@Autowired
	UserOrderRepository rep;
	
	@Autowired
	UserOrderService userOrderService;
	
	@GetMapping("/orderDelivery")
	public String order(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = "user1";
		List<UserDTO> userInfo = userOrderService.userInfo(id);
		session.setAttribute("userInfo", userInfo);
		return "userorder/order";
	}
}
