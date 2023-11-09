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
	
	//user
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
	
	//seller
	@GetMapping("/sellerOption")
	public String sellerOption( Model model) {
		List<OptionDTO> result  = rep.selectOption("40001");
		List<OptionDTO> result2 = rep.getCategoryAndSelectType("40001");
		model.addAttribute("get", result2);
		model.addAttribute("list", result);
		return "seller/menu_option";
		}
	
	@ResponseBody
	@RequestMapping( value="/sellerOptionSolo" , method=RequestMethod.POST)
	public void insertOptions(@RequestBody OptionDTO Option) {
		rep.insertOption(Option);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerOption" , method=RequestMethod.POST)
	public void insertOption(@RequestBody OptionDTO Option) {
		rep.insertOption(Option);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerOptionSolo" , method=RequestMethod.PUT)
	public void updateOption(@RequestBody OptionDTO Option) {
		rep.updateOption(Option);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerOption" , method=RequestMethod.PUT)
	public void updateOptionCategory(@RequestBody OptionDTO Option) {
		rep.updateOptionCategory(Option);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerOptionSolo/{optionCode}" , method=RequestMethod.DELETE)
	public void deleteOption(@PathVariable String optionCode) {
		rep.deleteOption(optionCode);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerOption/{category}" , method=RequestMethod.DELETE)
	public void deleteOptionCategory(@PathVariable String category) {
		OptionDTO option = new OptionDTO(0, 40001, category, 0, null, 0, null);
		rep.deleteOptionCategory(option);
	}
	

	
}
