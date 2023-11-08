package com.acorn.baemin.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.acorn.baemin.domain.ReviewDTO;


@Controller
public class ReviewController {
    @GetMapping("/writeReview")
    public String showReviewForm(Model model) {
    	System.out.println("테스트");
        model.addAttribute("review", new ReviewDTO());
        return "/review/review_register"; // Return the name of the JSP/Thymeleaf/HTML template
    }

    @PostMapping("/submitReview")
    public String submitReview(@ModelAttribute("review") ReviewDTO review) {
        System.out.println("테스트2");
        return "/review/review_submit"; // Redirect to a thank-you page or another appropriate page
    }
}
