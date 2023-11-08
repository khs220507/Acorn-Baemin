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
    @GetMapping("/write-review")
    public String showReviewForm(Model model) {
        model.addAttribute("review", new ReviewDTO());
        return "review-form"; // Return the name of the JSP/Thymeleaf/HTML template
    }
    
    @Autowired
    

    
    

    @PostMapping("/submit-review")
    public String submitReview(@ModelAttribute("review") ReviewDTO review) {
        // Handle the submitted review and rating here, e.g., save to a database
        return "redirect:/thank-you"; // Redirect to a thank-you page or another appropriate page
    }
}
