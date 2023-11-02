package com.acorn.baemin.option.controller;


import java.util.ArrayList;
import java.util.Arrays;
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

import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.option.repository.OptionRepository;
@Controller
public class OptionController {
	@Autowired
	OptionRepository rep;

	@GetMapping("/option")
	public String selectOption( Model model) {
		List<OptionDTO> result  = rep.selectOption("40001");
		List<String> OptionCategoryList = new ArrayList<>(result.size());
		for(OptionDTO list : result) {
			String OptionCategory =list.getOptionCategory();
			OptionCategoryList.add(OptionCategory);
		}
		String[] result2 = OptionCategoryList.stream().distinct().toArray(String[]::new);
		model.addAttribute("Categorylist", result2);
		model.addAttribute("list", result);
		return "store/option";
		}
	
//	@ResponseBody
//	@RequestMapping( value="/sellerHome" , method=RequestMethod.POST)
//	public void insertStore(@RequestBody StoreDTO Store) {
//		rep.insertStore(Store);
//	}
//	
//
//	@ResponseBody
//	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.DELETE)
//	public void deleteStore(@PathVariable String storecode) {
//		rep.deleteStore(storecode);
//	}
//	
//	@ResponseBody
//	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.GET)
//	public StoreDTO updateSellerStore(@PathVariable String storecode , Model model){	
//		StoreDTO store = rep.updateSellerStore(storecode);
//		return store;
//	}
//
//	@ResponseBody
//	@RequestMapping( value="/sellerHome" , method=RequestMethod.PUT)
//	public void updateStore(@RequestBody StoreDTO Store) {
//		System.out.println(Store);
//		rep.updateStore(Store);
//	}
	

}
