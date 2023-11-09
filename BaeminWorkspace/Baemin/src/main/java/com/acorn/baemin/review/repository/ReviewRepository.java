package com.acorn.baemin.review.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
