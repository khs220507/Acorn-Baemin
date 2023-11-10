package com.acorn.baemin.seller.service;

import java.util.List;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;


public interface SellerServiceI {
	
		// 태민
		// 메뉴탭
		// 메뉴 분류 조회(중복제거)
		public List<MenuDTO> selectMenuClassification(Integer storeCode);
		// 메뉴 전체 조회
		public List<MenuDTO> selectAllMenuInfo(Integer storeCode);
		// 메뷰 분류 수정
		public void modifingMenuClassification(String menuClassification);
		// 메뉴 등록
		public void insertMenu(MenuDTO menu);
		// 메뉴 수정
		public void modifingMenu(MenuDTO menu);
		// 메뉴 삭제
		public void deleteMenu(Integer menuCode);
		// 매장정보탭
		// 매장정보 조회
		public StoreDTO selectStore(int storeCode);
		// 사장님정보 조회
		public SellerDTO selectSeller(int sellerCode);
		// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
		public void modifingStoreDTA(StoreDTO store);
		// 사장님정보 일부수정(이름, 사업자등록번호)
		public void modifingSellerNmRn(SellerDTO seller);
		// 리뷰탭
		// 리뷰 전체 조회
		public List<ReviewDTO> selectAllReview();
		// 답변 등록
		public void insertAnswer(String answerContent);
		// 답변 수정
		public void updateAnswer(String answerContent);
		// 답변 삭제
		public void deleteAnswer(int answerCode);
}
