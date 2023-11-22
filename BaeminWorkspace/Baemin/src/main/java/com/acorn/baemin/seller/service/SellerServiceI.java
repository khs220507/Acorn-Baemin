package com.acorn.baemin.seller.service;

import java.util.List;

import com.acorn.baemin.domain.AnswerDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;


public interface SellerServiceI {
	
		// 메뉴탭
		// 메뉴 분류 조회(중복제거)
		public List<MenuDTO> selectMenuClassification(Integer storeCode);
		// 메뉴 전체 조회
		public List<MenuDTO> selectAllMenuInfo(Integer storeCode);
		// 메뷰 분류 수정
		public void modifingMenuClassification(MenuDTO menu);
		// 메뉴 등록
		public void insertMenu(MenuDTO menu);
		// 메뉴 수정
		public void modifingMenu(MenuDTO menu);
		public void modifingMenuIncludeImg(MenuDTO menu);
		// 메뉴 삭제
		public void deleteMenu(Integer menuCode);
		
		// 매장정보탭
		// 매장정보 조회
		public StoreDTO selectStore(Integer storeCode);
		// 사장님정보 조회
		public SellerDTO selectSeller(Integer sellerCode);
		// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
		public void modifingStoreDTA(StoreDTO store);
		
		// 리뷰탭
		// 리뷰 전체 조회
		public List<ReviewDTO> selectAllReview(Integer storeCode);
		// 가게 평점 평균
		public double storeAvgRating(Integer storeCode);
		// 리뷰 갯수 카운트
		public int reviewCount(Integer storeCode);
		// 답변 전체 조회
		public List<AnswerDTO> selectAllAnswer(Integer reviewCode);
		// 답변 등록
		public void insertAnswer(AnswerDTO answer);
		// 답변 수정
		public void updateAnswer(AnswerDTO answer);
		// 답변 삭제
		public void deleteAnswer(AnswerDTO answer);
}
