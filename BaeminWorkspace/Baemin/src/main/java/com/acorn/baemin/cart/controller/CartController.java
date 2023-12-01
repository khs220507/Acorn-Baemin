package com.acorn.baemin.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.baemin.cart.domain.CartInfoDTO;
import com.acorn.baemin.cart.service.CartServiceImp;
import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.home.repository.AddressRepositoryImp;
import com.acorn.baemin.order.service.UserOrderServiceImp;

@Controller
public class CartController {

	@Autowired
	CartServiceImp cartService;
	
	@Autowired
	AddressRepositoryImp addressDAO;

	@Autowired
	UserOrderServiceImp userOrderService;

	@PostMapping("/cartList")
	public String receiveCartData( CartInfoDTO cartInfoDTO, Model model, @RequestParam int menuCode, HttpServletRequest request) {
		List<StoreDTO> storeInfo = cartService.selectStoreInfo(menuCode);
		List<MenuDTO> menuInfo = cartService.selectMenuInfo(menuCode);
		model.addAttribute("cartInfo", cartInfoDTO);
		model.addAttribute("menuInfo", menuInfo);
		model.addAttribute("storeInfo", storeInfo);
		HttpSession session = request.getSession();
		session.setAttribute("cartInfo", cartInfoDTO);
		session.setAttribute("menuInfo", menuInfo);
		session.setAttribute("storeInfo", storeInfo);
	    return "home/cart_list";
	}
	
	@GetMapping("/cartListRe")
	public String receiveCartDataRe(Integer orderNumber, Model model, HttpSession session) {
		System.out.println("테스트!");
		System.out.println(orderNumber);
		OrderDTO orderInfo = cartService.selectOrderInfo(orderNumber);
		System.out.println(orderInfo);
		CartInfoDTO cartInfoDTO = new CartInfoDTO();
		cartInfoDTO.setOptions(orderInfo.getOptionsInfo());
		List<StoreDTO> storeInfo = cartService.selectStoreInfo(orderInfo.getMenuCode());
		List<MenuDTO> menuInfo = cartService.selectMenuInfo(orderInfo.getMenuCode());
		session.setAttribute("cartInfo", cartInfoDTO);
		session.setAttribute("menuInfo", menuInfo);
		session.setAttribute("storeInfo", storeInfo);
	    return "home/cart_list_re";
	    }
	

	@PostMapping("/order")
	public String placeOrder(@RequestParam int orderMenuPrice, HttpSession session, Model model, CartInfoDTO cartInfoDTO, OrderDTO orderDTO ) {
		
		session.setAttribute("orderMenuPrice", orderMenuPrice);
		Integer userCode = (Integer)session.getAttribute("userCode");
		List<StoreDTO> storeInfo = (List<StoreDTO>) session.getAttribute("storeInfo");
		session.setAttribute("storeInfo", storeInfo);
		List<MenuDTO> menuInfo = (List<MenuDTO>) session.getAttribute("menuInfo");
		System.out.println(userCode);
		List<UserDTO> userInfo = userOrderService.getUserByCode(userCode);
		orderDTO.setMenuCode(menuInfo.get(0).getMenuCode());
		orderDTO.setOrderStoreName(storeInfo.get(0).getStoreName());
		orderDTO.setOrderStoreImage(storeInfo.get(0).getStoreImage()); 
		orderDTO.setOrderMenuName(menuInfo.get(0).getMenuName());
		orderDTO.setStoreCode(storeInfo.get(0).getStoreCode());
		orderDTO.setOrderMenuPrice(orderMenuPrice);
		model.addAttribute("userInfo", userInfo);
		CartInfoDTO cartInfo = (CartInfoDTO) session.getAttribute("cartInfo");
		String optionsInfo = cartInfo.getOptions();
		orderDTO.setOptionsInfo(optionsInfo);
		orderDTO.setUserCode(userCode);
		session.setAttribute("orderDTO", orderDTO);
		
		int addressCode = (int) session.getAttribute("addressCode");
		AddressDTO addressDTO = addressDAO.returnAddressDTO(addressCode);
		model.addAttribute("addressDTO",addressDTO);
		System.out.println(addressDTO);
		
	    return "userorder/order";
	}
}
