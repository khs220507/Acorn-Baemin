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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.repository.UserOrderRepositoryImp;
import com.acorn.baemin.order.service.UserOrderServiceImp;

@Controller
public class UserOrderController {

	@Autowired
	UserOrderServiceImp userOrderService;

	@PostMapping("/orderDetail")
	public String submitOrder(HttpSession session) {
		System.out.println("테스트On");
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");

		System.out.println("테스트전 : " + orderDTO);
		userOrderService.insertOrder(orderDTO);
		System.out.println("테스트후 : " + orderDTO);

		return "home/order_detail";
	}

}
