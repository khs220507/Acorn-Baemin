package com.acorn.baemin.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.review.service.ReviewService;

@Controller
public class ReviewController {

	String fileDir = "c:\\test\\upload\\";

	@Autowired
	ReviewService reviewService;

	@GetMapping("/writeReview")
	public String showReviewForm(Model model) {
		model.addAttribute("review", new ReviewDTO());
		return "/review/review_register"; 
	}

	@ResponseBody
	@RequestMapping( value="/submitReview", method=RequestMethod.POST)
	public String submitReview(int reviewCode, int menuCode, int userCode, int storeCode, String reviewImage, String reviewDate, int reviewRating, String reviewContent ) {
		System.out.println(reviewImage);
		if (!reviewImage.isEmpty()) {
		
		
		
		
	}
		System.out.println("테스트2");
		return "redirect:/review/review_submit";

		
}
}
