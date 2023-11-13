package com.acorn.baemin.home.controller;

import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;
import com.acorn.baemin.home.repository.OrderDetailRepositoryImp;
import com.acorn.baemin.home.repository.OrderRepositoryImp;
import com.acorn.baemin.home.repository.SearchRepositoryImp;
import com.acorn.baemin.home.repository.ZzimRepositoryImp;

@Controller
public class HomeController {

	@Autowired
	SearchRepositoryImp searchDAO;

	@Autowired
	ZzimRepositoryImp zzimDAO;

	@Autowired
	OrderRepositoryImp orderDAO;

	@Autowired
	OrderDetailRepositoryImp detailDAO;

	// 홈화면
	@GetMapping("/home")
	public String home(Model model) {

		String[] foodCategories = {"치킨", "피자", "햄버거", "족발,보쌈", "한식", "중식","일식","양식","분식","디저트","야식"};
        model.addAttribute("categories", foodCategories);
        
		return "home/home";
	}
	////////////////////////////////////////////////////////////////////////

	// 검색
	@GetMapping("/search")
	public String searchList(@RequestParam String searchTerm, Model model) {
		
		List<StoreDTO> result;
		result = searchDAO.searchStoresAndMenus(searchTerm);
		
		if (result.isEmpty()) {
			model.addAttribute("noResults", true);
		} else {
			model.addAttribute("searchList", result);
		}
		
		return "home/search_result";

	}

	////////////////////////////////////////////////////////////////////////

	// 찜
	@GetMapping("/zzim")
	public String zzimList(Model model, HttpSession session) {
		List<ZzimStoreDTO> result;
		
		int userCode = (int)session.getAttribute("userCode");
		try {
			result = zzimDAO.zzimSelectAll(userCode);
			model.addAttribute("zzimList", result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home/zzim_list";
		//return "home/test";
	}

	// 찜 삭제
	@ResponseBody
	@GetMapping("/zzimDelete")
	public int zzimDelete(int storeCode,  HttpSession session) throws Exception {
		int userCode = (int)session.getAttribute("userCode");
		int result = zzimDAO.zzimDelete(userCode, storeCode);

		return result;

	}
	
	//////////////////////////////////////////////////////////////////////////

	// 주문내역 조회
	@GetMapping("/orderList")
	public String orderList(Model model, HttpSession session) {
		List<OrderDTO> result;
		int userCode = (int)session.getAttribute("userCode");

		try {
			result = orderDAO.orderSelectAll(userCode);
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

	// 주문 상세내역 삭제
//		@GetMapping("/orderDetailDelete")
//		public String orderDetailDelete(int orderNumber) {
//
//			detailDAO.orderDetailDelete(orderNumber);
//			
//			return "home/order_list";
//
//		}
	
}
