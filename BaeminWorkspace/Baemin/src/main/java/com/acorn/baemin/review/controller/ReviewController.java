package com.acorn.baemin.review.controller;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.review.service.ReviewService;




@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
    @GetMapping("/writeReview")
    public String showReviewForm(Model model) {
        model.addAttribute("review", new ReviewDTO());
        return "/review/review_register"; // Return the name of the JSP/Thymeleaf/HTML template
    }

    @PostMapping("/submitReview")
    public String submitReview(@ModelAttribute("review") ReviewDTO review) {
    	System.out.println("LLLLL"+ review);
    	reviewService.insertReview(review);
        return "/review/review_submit"; // Redirect to a thank-you page or another appropriate page
    }
}
