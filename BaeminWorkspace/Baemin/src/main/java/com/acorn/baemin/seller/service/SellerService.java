package com.acorn.baemin.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.repository.SellerRepository;

@Service
public class SellerService implements ServiceI{
	
	@Autowired
	SellerRepository rep;
	
	// 태민
	// 메뉴 탭
	// 메뉴 전체 조회
	@Override
	public List<MenuDTO> selectAllMenuInfo() {
		System.out.println("selectMenuInfo @service");
		List<MenuDTO> list =  rep.selectAllMenuInfo();
		return list;
	}
	// 매장정보 탭
	// 매장정보 일부조회1(매장이름, 평점, 리뷰수, 최소주문금액)
	@Override
	public StoreDTO selectStoreNmRtRcMp(int storeCode) {
		System.out.println("storeCode @service : " + storeCode);
		System.out.println("selectStoreNmRtRcMp @service");
		return rep.selectStoreSubInfo1(storeCode);
	}
	// 매장정보 일부조회2(가게소개, 운영시간, 매장주소)
	@Override
	public StoreDTO selectStoreDTA(int storeCode) {
		System.out.println("storeCode @service : " + storeCode);
		System.out.println("selectStoreDTA @service");
		return rep.selectStoreSubInfo2(storeCode);
	}
	// 사장님정보 일부조회(이름, 사업자등록번호)
	@Override
	public SellerDTO selectSellerNmRn(int sellerCode) {
		System.out.println("storeCode @service : " + sellerCode);
		System.out.println("selectSellerNmRn @service");
		return rep.selectSellerSubInfo(sellerCode);
	}
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	@Override
	public void modifingStoreDTA(StoreDTO store) {
		System.out.println("modifingStoreDTA @service");
		rep.updateStoreSubInfo(store);
	}
	// 사장님정보 일부수정(이름, 사업자등록번호)
	@Override
	public void modifingSellerNmRn(SellerDTO seller) {
		System.out.println("modifingSellerNmRn @service");
		rep.updateSellerSubInfo(seller);
	}
	// 리뷰 탭
	// 리뷰 전체 조회
	@Override
	public List<ReviewDTO> selectAllReview() {
		System.out.println("selectAllReview @service");
		return rep.selectAllReview();
	}
	// 답변 등록
	@Override
	public void insertAnswer(String AnswerContent) {
		System.out.println("selectAllReview @service");
		rep.insertAnswer(AnswerContent);
	}
	// 답변 수정
	@Override
	public void updateAnswer(String AnswerContent) {
		System.out.println("selectAllReview @service");
		rep.updateAnswer(AnswerContent);
	}
	// 답변 삭제
	@Override
	public void deleteAnswer(int AnswerCode) {
		System.out.println("selectAllReview @service");
		rep.deleteAnswer(AnswerCode);
	}

	
	
	
	
	
}
