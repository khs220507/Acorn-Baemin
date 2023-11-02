package com.acorn.baemin.sellerhome.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.sellerhome.repository.SellerHomeRepository;
@Controller
public class SellerHomeController {
	@Autowired
	SellerHomeRepository rep;

	@GetMapping("/sellerHome")
	public String sellerStore( Model model) {
		List<StoreDTO> result  = rep.sellerStore("20001");
		model.addAttribute("list", result);
		return "seller/seller_home";
		}
	
	@ResponseBody
	@RequestMapping( value="/sellerHome" , method=RequestMethod.POST)
	public void insertStore(@RequestBody StoreDTO Store) {
		rep.insertStore(Store);
	}
	

	@ResponseBody
	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.DELETE)
	public void deleteStore(@PathVariable String storecode) {
		rep.deleteStore(storecode);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.GET)
	public StoreDTO updateSellerStore(@PathVariable String storecode , Model model){	
		StoreDTO store = rep.updateSellerStore(storecode);
		return store;
	}

	@ResponseBody
	@RequestMapping( value="/sellerHome" , method=RequestMethod.PUT)
	public void updateStore(@RequestBody StoreDTO Store) {
		System.out.println(Store);
		rep.updateStore(Store);
	}
	

}
