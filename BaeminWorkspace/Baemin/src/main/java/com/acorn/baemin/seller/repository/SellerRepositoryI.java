package com.acorn.baemin.seller.repository;

import java.util.List;

import com.acorn.baemin.domain.AnswerDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;



public interface SellerRepositoryI {
	
	
	// 태민
	// 메뉴관리탭
	// 메뉴 전체 조회
	public List<MenuDTO> selectAllMenuInfo();
	
	// 가게정보관리탭
	// 가게정보 일부조회1(가게이름, 평점, 리뷰수, 최소주문금액)
	public StoreDTO selectStoreSubInfo1(int storeCode);
	// 가게정보 일부조회2(가게소개, 영업시간, 매장주소)
	public StoreDTO selectStoreSubInfo2(int storeCode);
	// 사장님정보 일부조회(이름, 사업자등록번호)
	public SellerDTO selectSellerSubInfo(int sellerCode);
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	public int updateStoreSubInfo(StoreDTO store);
	// 사장님정보 일부수정(이름, 사업자등록번호)
	public int updateSellerSubInfo(SellerDTO seller);
	
	// 리뷰관리탭
	// 리뷰 전체 조회
	public List<ReviewDTO> selectAllReview();
	// 답변 등록
	public int insertAnswer(String AnswerContent);
	// 답변 수정
	public int updateAnswer(String AnswerContent);
	// 답변 삭제
	public int deleteAnswer(int AnswerCode);
	
}
