package com.acorn.baemin.review.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;

@Repository
public class ReviewRepository implements ReviewRepositoryI {

	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "com.acorn.ReviewMapper.";
	@Override
	public void insertReview(ReviewDTO review) {
		System.out.println("rep : " + review);
		sqlSession.insert(namespace + "insertReview", review);
		
	}
	@Override
	public void updateReviewStatus(OrderDTO orderDTO) {
		sqlSession.update(namespace + "updateReviewStatus", orderDTO);
		
	}
	@Override
	public int reviewCount(int storeCode) {
		return sqlSession.selectOne(namespace + "reviewCount", storeCode);
	}
	@Override
	public double storeAvgRating(int storeCode) {
		return sqlSession.selectOne(namespace + "storeAvgRating", storeCode);
	}

}
