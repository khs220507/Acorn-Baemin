package com.acorn.baemin.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.domain.ZzimStoreDTO;
import com.acorn.baemin.home.repository.AddressRepositoryImp;
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
	
	@Autowired
	AddressRepositoryImp addressDAO;

	// 홈화면
	@GetMapping("/home")
	public String home(HttpSession session,Model model) {
	    Integer userCode = (Integer) session.getAttribute("userCode");
	    System.out.println(userCode);
	    if (userCode != null) {
	        Integer addressCode = (Integer) session.getAttribute("addressCode");
	        System.out.println(addressCode);
	        if (addressCode != null) {
	            AddressDTO addressDTO = addressDAO.returnAddressDTO(addressCode);
	            System.out.println("addressDTO @ controller : " + addressDTO);
	            model.addAttribute("deliveryAddress", addressDTO.getDeliveryAddress());
	        }
	    }
			
//			List<AddressDTO> addressList = addressDAO.selectAddress(userCode);
//			model.addAttribute("addressList", addressList);
		
		String[] foodCategories = {"치킨", "피자", "햄버거", "족발보쌈", "한식", "중식", "일식", "양식", "분식", "디저트", "야식"};
        model.addAttribute("categories", foodCategories);
		return "home/home";
	}
	////////////////////////////////////////////////////////////////////////
	
	// 주소 등록
	@ResponseBody
	@PostMapping("/addressAdd")
	public String insertAddress(HttpSession session,@RequestParam("deliveryAddress") String deliveryAddress,@RequestParam("detailDeliveryAddress") String detailDeliveryAddress) {
		int userCode = (int)session.getAttribute("userCode");
		AddressDTO addressDTO = new AddressDTO(0,userCode, deliveryAddress, detailDeliveryAddress,1);
		addressDAO.insertAddress(addressDTO);
		
		// 주소코드 가져와서 세션에 넣기
		int addressCode = addressDAO.getAddressCodeKakao(addressDTO);
		session.setAttribute("addressCode", addressCode);
		
		// 1 => 0으로 변경
		AddressDTO addressSwitch = new AddressDTO(addressCode, userCode, deliveryAddress, detailDeliveryAddress, 0);
		addressDAO.addressStatusSwitch(addressSwitch);
		
		return "address-upload-ok";
	}
	
	// 주소 변경
//	@ResponseBody
//	@PutMapping("/addressUpdate")
//	public String updateAddress(@RequestBody AddressDTO addressDTO, HttpSession session) {
//		System.out.println("업데이트돼라제발");
//		int userCode = (int)session.getAttribute("userCode");
//		int addressCode = (int)session.getAttribute("addressCode");
//		AddressDTO addressDTO = new AddressDTO(addressCode, userCode, deliveryAddress, detailDeliveryAddress, 1);
//		System.out.println("업데이트시 주소디티오!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1" + addressDTO);
//		addressDAO.updateAddress(addressDTO);
//		
//		return "address-update-ok";
//	}
	
	// 주소 조회
	@ResponseBody
	@GetMapping("/address")
	public List<AddressDTO> selectAddress(HttpSession session, Model model) {
		int userCode = (int)session.getAttribute("userCode");
		List<AddressDTO> address = addressDAO.selectAddress(userCode);
		return address;
	}
	
	
	// 주소 삭제
	@ResponseBody
	@GetMapping("/addressDelete")
	public String deleteAddress(int addressCode) {
		addressDAO.deleteAddress(addressCode);
		
		return "address-delete-ok";
	}
	
	// 1, 0 변경
	@ResponseBody
	@PostMapping("/addressStatusSwitch")
	public String addressStatusSwitch(@RequestParam("addressCode")int addressCode, HttpSession session) {
		
		int userCode = (int)session.getAttribute("userCode");
		AddressDTO addressDTO = new AddressDTO(addressCode,userCode, null, null,0);
		addressDAO.addressStatusSwitch(addressDTO);	
		addressDAO.AddressToOne(addressCode);
		
		session.setAttribute("addressCode", addressCode);
		
		return "1-0 switch-ok";
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
			System.out.println("찜리스트" + result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home/zzim_list";
		
	}
	
	// 찜 리스트 삭제
	@ResponseBody
	@GetMapping("/zzimDelete")
	public int zzimDelete(int storeCode,  HttpSession session) throws Exception {
		int userCode = (int)session.getAttribute("userCode");
		int result = zzimDAO.zzimDelete(userCode, storeCode);

		return result;

	}
	// 찜 삭제 
	@ResponseBody
	@RequestMapping( value="/zzimClear" , method=RequestMethod.DELETE)
	public void zzimClear(@RequestBody ZzimDTO Zzim){
	 zzimDAO.zzimClear(Zzim);
	}
	
	
	// 찜 추가
	@ResponseBody
	@RequestMapping( value="/zzimInsert" , method=RequestMethod.POST)
	public void zzimInsert(@RequestBody ZzimDTO Zzim) {
		zzimDAO.zzimInsert(Zzim);
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
	public String orderDetailSelect(HttpSession session, @RequestParam int orderNumber, Model model) {

		List<OrderDTO> result = detailDAO.orderDetailSelect(orderNumber);
		model.addAttribute("orderDetail", result);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ result);


		
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
