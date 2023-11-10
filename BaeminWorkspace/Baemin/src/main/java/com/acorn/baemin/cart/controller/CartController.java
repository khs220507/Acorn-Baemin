package com.acorn.baemin.cart.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.cart.repository.CartRepository;
import com.acorn.baemin.cart.service.CartService;

@Controller
public class CartController {

	
	@Autowired
	CartRepository rep;
	
	@Autowired
	CartService cartService;

	@GetMapping("/cartList")
	public String cartList(HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			String id = "user1";

			Map<String, List> cartMap = cartService.cartList(id);
			session.setAttribute("cartMap", cartMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "home/cart_list";
	}

	@ResponseBody
	@RequestMapping(value = "/cartList/{cartCode}", method = RequestMethod.DELETE)
	public void deleteCart(@PathVariable String cartCode) {
		rep.deleteCart(cartCode);
	}
	
	
	
	
}
