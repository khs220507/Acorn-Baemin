package com.acorn.baemin.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.review.service.ReviewService;

import java.io.File;
import java.io.IOException;

@Controller
public class ReviewController {

	private String fileDir = "c:\\test\\upload\\";

	@Autowired
	ReviewService reviewService;

	@GetMapping("/writeReview")
	public String showReviewForm() {
		return "/review/review_register";
	}
	
	@PostMapping("/submitReview")
	public String saveReview( @RequestParam String reviewContent,
	@RequestParam MultipartFile reviewImage, @RequestParam int reviewRating, @RequestParam String reviewDate, Model model ) throws IOException {
	if (!reviewImage.isEmpty()) {
	String fullPath = fileDir + reviewImage.getOriginalFilename();
	reviewImage.transferTo(new File(fullPath));
	model.addAttribute("fileName" , reviewImage.getOriginalFilename());
	}
	
	// Create a ReviewDTO and set its properties
    ReviewDTO reviewDTO = new ReviewDTO();
    reviewDTO.setReviewDate(reviewDate);
    reviewDTO.setReviewContent(reviewContent);
    reviewDTO.setReviewRating(reviewRating);
    // Set other properties as needed

    // Save the review to the database using the ReviewService
    reviewService.insertReview(reviewDTO);
	return "review/review_submit";
	}
	

}
