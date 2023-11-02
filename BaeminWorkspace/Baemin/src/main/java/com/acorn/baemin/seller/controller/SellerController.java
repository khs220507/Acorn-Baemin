package com.acorn.baemin.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.service.SellerService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerService sc;
	
	
	@GetMapping("/store_manage")
	public String read(@RequestParam("storeCode") int storeCode, @RequestParam("sellerCode") int sellerCode, Model model) {
		
		System.out.println("storeCode : "+storeCode);
		System.out.println("sellerCode : "+sellerCode);
		StoreDTO readStoreNmRtRcMp = sc.selectStoreNmRtRcMp(storeCode);
		StoreDTO readtStoreDTA = sc.selectStoreDTA(storeCode);
		SellerDTO readSellerNmRn = sc.selectSellerNmRn(sellerCode);
		
		model.addAttribute("readStoreNmRtRcMp", readStoreNmRtRcMp);
		model.addAttribute("readtStoreDTA", readtStoreDTA);
		model.addAttribute("readSellerNmRn", readSellerNmRn);
		
		return "seller/store_manage";
		
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
