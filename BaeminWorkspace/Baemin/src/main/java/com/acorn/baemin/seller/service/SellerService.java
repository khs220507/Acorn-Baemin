package com.acorn.baemin.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.repository.SellerRepository;

@Service
public class SellerService implements ServiceI{
	
	@Autowired
	SellerRepository rep;
	
	// 태민
	// 매장정보탭
	// 매장정보 일부조회1(매장이름, 평점, 리뷰수, 최소주문금액)
	@Override
	public StoreDTO selectStoreNmRtRcMp(int storeCode) {
		System.out.println("service : selectStoreNmRtRcMp");
		System.out.println(storeCode);
		return rep.selectStoreSubInfo1(storeCode);
	}
	// 매장정보 일부조회2(가게소개, 운영시간, 매장주소)
	@Override
	public StoreDTO selectStoreDTA(int storeCode) {
		System.out.println("service : selectStoreDTA");
		System.out.println(storeCode);
		return rep.selectStoreSubInfo2(storeCode);
	}
	// 사장님정보 일부조회(이름, 사업자등록번호)
	@Override
	public SellerDTO selectSellerNmRn(int sellerCode) {
		System.out.println("service : selectSellerNmRn");
		System.out.println(sellerCode);
		return rep.selectSellerSubInfo(sellerCode);
	}
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	@Override
	public void modifingStoreDTA(StoreDTO store) {
		System.out.println("service : modifingStoreDTA");
		rep.updateStoreSubInfo(store);
	}
	// 사장님정보 일부수정(이름, 사업자등록번호)
	@Override
	public void modifingSellerNmRn(SellerDTO seller) {
		System.out.println("service : modifingSellerNmRn");
		rep.updateSellerSubInfo(seller);
	}
	// 리뷰탭
	// 리뷰 전체 조회
	@Override
	public List<ReviewDTO> selectAllReview() {
		System.out.println("service : selectAllReview");
		return rep.selectAllReview();
	}
	// 답변 등록
	@Override
	public void insertAnswer(String AnswerContent) {
		System.out.println("service : selectAllReview");
		rep.insertAnswer(AnswerContent);
	}
	// 답변 수정
	@Override
	public void updateAnswer(String AnswerContent) {
		System.out.println("service : selectAllReview");
		rep.updateAnswer(AnswerContent);
	}
	// 답변 삭제
	@Override
	public void deleteAnswer(int AnswerCode) {
		System.out.println("service : selectAllReview");
		rep.deleteAnswer(AnswerCode);
	}

	
	
	
	
	
}
