package com.acorn.baemin.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.order.domain.KakaoOrderDTO;
import com.acorn.baemin.order.domain.KakaoPayApprovalVO;
import com.acorn.baemin.order.service.UserOrderServiceImp;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {

	@Setter(onMethod_ = @Autowired)
	private KakaoPay kakaopay;
	
	@Autowired 
	UserOrderServiceImp userOrderService;

	KakaoOrderDTO orderDTO;

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {

	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(KakaoOrderDTO order, HttpSession session, @RequestParam String deliveryAddress,
			@RequestParam int deliveryFee, @RequestParam int payType, @RequestParam int orderType,
			@RequestParam String reqToSeller, @RequestParam String reqToRider, @RequestParam String userPhone,@RequestParam String allAddress) {
		log.info("kakaoPay post............................................");

		// 결제정보를 받아서 kakaPayReay( order )//현재결제해야하는 결제정보를 넘겨줌
		
		this.orderDTO = order;
		orderDTO.setItem_name("test");
		orderDTO.setPartner_order_id("test");
		orderDTO.setPartner_user_id("test");
		orderDTO.setTotal_amount("30000");
		orderDTO.setQuantity("1");
		
		OrderDTO orderDTOInfo = (OrderDTO) session.getAttribute("orderDTO");
		System.out.println("기본주문정보");
		int menuCode = orderDTOInfo.getMenuCode();
		int userCode = orderDTOInfo.getUserCode();
		int storeCode = orderDTOInfo.getStoreCode();
		String orderMenuName = orderDTOInfo.getOrderMenuName();
		int orderMenuNumber = orderDTOInfo.getOrderMenuNumber();
		String orderStoreName = orderDTOInfo.getOrderStoreName();
		String orderStoreImage = orderDTOInfo.getOrderStoreImage();
		
		
		orderDTO.setOrderStoreImage(orderStoreImage);
		orderDTO.setOrderStoreName(orderStoreName);
		orderDTO.setOrderMenuNumber(orderMenuNumber);
		orderDTO.setOrderMenuName(orderMenuName);
		orderDTO.setMenuCode(menuCode);
		orderDTO.setUserCode(userCode);
		orderDTO.setStoreCode(storeCode);
		orderDTO.setDeliveryAddress(allAddress);
		orderDTO.setReqToRider(reqToRider);
		orderDTO.setReqToSeller(reqToSeller);
		orderDTO.setOrderStatus("주문접수");
		orderDTO.setUserPhone(userPhone);
		orderDTO.setPayType(payType);
		orderDTO.setOrderType(orderType);
		orderDTO.setOrderDate("오늘");

		userOrderService.insertKakaoOrder(orderDTO); 
		OrderDTO lastOrderDTO =	userOrderService.getLastOrder(); 
		System.out.println("주문번호 : ");
		System.out.println(lastOrderDTO.getOrderNumber());
		System.out.println("카카오페이테스트orderDTO");
		System.out.println(orderDTO);

		return "redirect:" + kakaopay.kakaoPayReady(orderDTO);

	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(RedirectAttributes redirectAttributes, @RequestParam("pg_token") String pg_token, Model model) {

		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		KakaoPayApprovalVO approvalVo = kakaopay.kakaoPayInfo(pg_token, orderDTO);
		model.addAttribute("info", approvalVo);
		model.addAttribute("orderDTO", orderDTO);

		// order
		
		

		 OrderDTO lastOrderDTO = userOrderService.getLastOrder();
		 System.out.println(lastOrderDTO.getOrderNumber());
		 redirectAttributes.addAttribute("orderNumber", lastOrderDTO.getOrderNumber()); 
		 return "redirect:orderDetail"; 

	}

}