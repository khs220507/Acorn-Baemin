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

import com.acorn.baemin.cart.repository.CartRepository;
import com.acorn.baemin.cart.service.CartService;

@Controller
public class OrderController {

	
	
	@GetMapping("/orderDelivery")
	public String order(HttpServletRequest request) {

		return "order/order";
	}

	
}
