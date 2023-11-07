package com.acorn.baemin.seller.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.service.SellerService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerService sc;
	
//	@GetMapping("/menu_manage")
// public String readmNst(@RequestParam("storeCode") int storeCode, Model model) {
//	 	
//		System.out.println("storeCode @service : " + storeCode);
//		List<MenuDTO> readMenuInfo = sc.selectMenuInfo();
//		System.out.println(readMenuInfo);
//		StoreDTO readStoreNmRtRcMp = sc.selectStoreNmRtRcMp(storeCode);
//		
//		/*
//		Map<String , Object> map = new HashMap<>();
//		map.put("list", readtMenuInfo);
//		map.put("storeInfo", readStoreNmRtRcMp);
//		*/
//		model.addAttribute("readStoreNmRtRcMp", readStoreNmRtRcMp);
//		model.addAttribute("readMenuInfo", readMenuInfo);
//		
//		return "seller/store_manage";
//	}
//	
	@GetMapping("/store_manage")
	public String readstNs(@RequestParam("storeCode") int storeCode, @RequestParam("sellerCode") int sellerCode, Model model) {
		
		System.out.println("storeCode @service 22222: " + storeCode);
		System.out.println("sellerCode @service : " + sellerCode);
		StoreDTO readStoreNmRtRcMp = sc.selectStoreNmRtRcMp(storeCode);
		StoreDTO readtStoreDTA = sc.selectStoreDTA(storeCode);
		SellerDTO readSellerNmRn = sc.selectSellerNmRn(sellerCode);
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo();
		System.out.println(readMenuInfo);
		
		model.addAttribute("readStoreNmRtRcMp", readStoreNmRtRcMp);
		model.addAttribute("readtStoreDTA", readtStoreDTA);
		model.addAttribute("readSellerNmRn", readSellerNmRn);
		model.addAttribute("readMenuInfo", readMenuInfo);
		
		return "seller/store_manage";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/menu_list" , method=RequestMethod.GET)
	public List<MenuDTO> selectAllMenuList() {
		List<MenuDTO> menu = sc.selectAllMenuInfo();
		return menu;
	}
	
	
	
	
	
//	@GetMapping("/sellerHome")
//	public String selectAll( Model model) {
//
//		List<StoreDTO> result  = rep.sellerStore("20001");
//		model.addAttribute("list", result);
//		System.out.println( result);
//		return "seller/seller_home";
//		}
//	
//	@ResponseBody
//	@RequestMapping( value="/sellerHome" , method=RequestMethod.POST)
//	public void register(@RequestBody StoreDTO Store) {
//		rep.insertStore(Store);
//	}
	

//	@GetMapping("/sellerall")
//	public String  main(Model model ) {		
//		List<StoreDTO> result;
//
//		try {
//			result = rep.selectAll();
//			
//			model.addAttribute("list", result);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return "seller/test1";
//	}
	

}
