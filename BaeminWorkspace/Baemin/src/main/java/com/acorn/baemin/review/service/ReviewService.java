package com.acorn.baemin.review.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.review.repository.ReviewRepository;

public class ReviewService implements ReviewServiceI{

	
	@Autowired
	ReviewRepository reviewRepository;
	
	@Override
    public void insertReview(ReviewDTO review) {
		reviewRepository.insertReview(review);
    }

}
