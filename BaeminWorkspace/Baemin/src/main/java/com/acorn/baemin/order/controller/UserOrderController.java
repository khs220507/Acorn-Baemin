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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.order.repository.UserOrderRepositoryImp;
import com.acorn.baemin.order.service.UserOrderServiceImp;

@Controller
public class UserOrderController {

	@Autowired
	UserOrderServiceImp userOrderService;

	@PostMapping("/orderDetail")
	public String submitOrder(RedirectAttributes redirectAttributes, HttpSession session, @RequestParam String deliveryAddress, @RequestParam int deliveryFee, 
			@RequestParam int payType,
			@RequestParam int orderType,
			@RequestParam String reqToSeller, 
            @RequestParam String reqToRider,
            @RequestParam String userPhone) {
		System.out.println("테스트On");
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
		orderDTO.setDeliveryAddress(deliveryAddress);
		orderDTO.setDeliveryFee(deliveryFee);
		orderDTO.setReqToRider(reqToRider);
	    orderDTO.setReqToSeller(reqToSeller);
	    orderDTO.setOrderStatus("주문접수");
		orderDTO.setUserPhone(userPhone);
		orderDTO.setPayType(payType);
		orderDTO.setOrderType(orderType);
		
		userOrderService.insertOrder(orderDTO);
		
		OrderDTO lastOrderDTO = userOrderService.getLastOrder();
		System.out.println(lastOrderDTO.getOrderNumber());
		redirectAttributes.addAttribute("orderNumber", lastOrderDTO.getOrderNumber());
		return "redirect:orderDetail";
	}

}
