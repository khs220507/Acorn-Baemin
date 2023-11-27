package com.acorn.baemin.review.service;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;

public interface ReviewServiceI {

    void insertReview(ReviewDTO review);
    void updateReviewStatus(OrderDTO orderDTO);

}
