package com.acorn.baemin.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.review.repository.ReviewRepository;

@Component
public class ReviewService implements ReviewServiceI{

	
	@Autowired
	ReviewRepository reviewRepository;
	
	@Override
    public void insertReview(ReviewDTO review) {
		System.out.println("servie : " + review);
		reviewRepository.insertReview(review);
    }

	@Override
	public void updateReviewStatus(OrderDTO orderDTO) {
		reviewRepository.updateReviewStatus(orderDTO);
		
	}

	@Override
	public int reviewCount(int storeCode) {
		return reviewRepository.reviewCount(storeCode);
	}

	@Override
	public double storeAvgRating(int storeCode) {
		return reviewRepository.storeAvgRating(storeCode);
	}

}
