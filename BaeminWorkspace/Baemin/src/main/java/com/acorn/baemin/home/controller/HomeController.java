package com.acorn.baemin.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;
import com.acorn.baemin.home.repository.OrderDetailRepositoryImp;
import com.acorn.baemin.home.repository.OrderRepository;
import com.acorn.baemin.home.repository.ZzimRepository;


@Controller
public class HomeController {
	
	@Autowired
	ZzimRepository zzimDAO;
	
	@Autowired
	OrderRepository orderDAO;

	@Autowired
	OrderDetailRepositoryImp detailDAO;
	
	
	// 홈화면
	@GetMapping("/home")
	public String home() {
		return "home/home";
	}
	
	////////////////////////////////////////////////////////////////////////
	
	// 찜
	@GetMapping("/zzim")
	public String zzimList(Model model) {
		List<ZzimStoreDTO> result;
		try {
			result = zzimDAO.zzimSelectAll(10001);
			model.addAttribute("zzimList", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "home/zzim_list";
	}
	//////////////////////////////////////////////////////////////////////////
	
	// 주문내역 조회
	@GetMapping("/orderList")
	public String orderList(Model model) {
		List<OrderDTO> result;
		
		try {
			result = orderDAO.orderSelectAll(10001);
			System.out.println(result);
			model.addAttribute("orderList", result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home/order_list";
	}


	// 주문내역 삭제
	@GetMapping("/orderListDelete")
	public String orderListDelete(int orderNumber) {
		
		System.out.println("server sdjdjdjdjdjdd"+orderNumber);
		orderDAO.orderDelete(orderNumber);
		
		return "redirect:/orderList";
		
	}
	
	////////////////////////////////////////////////////////////////////////
	
	// 주문 상세내역 조회
	@GetMapping("/orderDetail")
	public String orderDetailSelect(@RequestParam int orderNumber, Model model) {
		
		List<OrderDTO> result = detailDAO.orderDetailSelect(orderNumber);
		model.addAttribute("orderDetail", result);
		System.out.println("orderNumber= " + orderNumber);
		
		return "home/order_detail";
	}
	
	
	
}
