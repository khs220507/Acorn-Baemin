package com.acorn.baemin.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.home.repository.AddressRepositoryImp;
import com.acorn.baemin.order.service.UserOrderServiceImp;

@Controller
public class UserOrderController {

	@Autowired
	UserOrderServiceImp userOrderService;
	
	@Autowired
	AddressRepositoryImp addressDAO;

	@PostMapping("/orderDetail")
	public String submitOrder(RedirectAttributes redirectAttributes, HttpSession session, @RequestParam String deliveryAddress, @RequestParam String allAddress,  @RequestParam String detailDeliveryAddress, @RequestParam int deliveryFee, 
			@RequestParam int payType,
			@RequestParam int orderType,
			@RequestParam String reqToSeller, 
            @RequestParam String reqToRider,
            @RequestParam String userPhone) {
		System.out.println("테스트On");
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
		orderDTO.setDeliveryAddress(allAddress);
		orderDTO.setDeliveryFee(deliveryFee);
		System.out.println(deliveryFee);
		orderDTO.setReqToRider(reqToRider);
	    orderDTO.setReqToSeller(reqToSeller);
	    orderDTO.setOrderStatus("주문접수");
		orderDTO.setUserPhone(userPhone);
		orderDTO.setPayType(payType);
		orderDTO.setOrderType(orderType);
		orderDTO.setReviewStatus(0);
		userOrderService.insertOrder(orderDTO);
		System.out.println(orderDTO);
		
		OrderDTO lastOrderDTO = userOrderService.getLastOrder();
		System.out.println(lastOrderDTO.getOrderNumber());
		redirectAttributes.addAttribute("orderNumber", lastOrderDTO.getOrderNumber());
		
		////////////// 주소 업데이트 ////////////////////
		System.out.println("업데이트돼라제발");
		int userCode = (int)session.getAttribute("userCode");
		int addressCode = (int)session.getAttribute("addressCode");
		AddressDTO addressDTO = new AddressDTO(addressCode, userCode, deliveryAddress, detailDeliveryAddress, 1);
		System.out.println("업데이트시 주소디티오!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1" + addressDTO);
		addressDAO.updateAddress(addressDTO);
		
		return "redirect:orderDetail";
	}

}
