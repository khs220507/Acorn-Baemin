package com.acorn.baemin.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/review")
	public String reviewRegister(HttpServletRequest request) {
		return "userorder/review_register";
		
	}

}
