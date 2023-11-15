package com.acorn.baemin.selectstrore.controller;


import java.net.MalformedURLException;
import java.util.List;

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

import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.selectstrore.repository.SelectStrollerRepository;
@Controller
public class SelectStrollerController {
	@Autowired
	SelectStrollerRepository rep;

	@GetMapping("/storeList")
	public String selectStore(@RequestParam String storeCategory, Model model) {
		List<StoreDTO> result  = rep.selectStore(storeCategory);
		model.addAttribute("list", result);
		return "store/store_list";
		}

}
