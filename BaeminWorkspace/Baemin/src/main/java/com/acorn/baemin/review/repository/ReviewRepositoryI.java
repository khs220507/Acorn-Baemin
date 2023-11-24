package com.acorn.baemin.review.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;


public interface ReviewRepositoryI {
	
	void insertReview(ReviewDTO review);
	void updateReviewStatus(OrderDTO orderDTO);

}
