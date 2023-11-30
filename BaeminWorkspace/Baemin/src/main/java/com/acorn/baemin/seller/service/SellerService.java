package com.acorn.baemin.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.AnswerDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.repository.SellerRepository;

@Service
public class SellerService implements SellerServiceI{
	
	@Autowired
	SellerRepository rep;
	
	// 메뉴 탭
	// 메뉴 분류 조회(중복제거)
	@Override
	public List<MenuDTO> selectMenuClassification(Integer storeCode) {
		System.out.println("selectMenuClassification @service");
		List<MenuDTO> CList = rep.selectMenuClassification(storeCode);
		return CList;
	}
	// 메뉴 전체 조회
	@Override
	public List<MenuDTO> selectAllMenuInfo(Integer storeCode) {
		System.out.println("selectAllMenuInfo @service");
		List<MenuDTO> list =  rep.selectAllMenuInfo(storeCode);
		return list;
	}
	// 메뉴 분류 수정
	@Override
	public void modifingMenuClassification(MenuDTO menu) {
		System.out.println("menuClassification @service : " + menu);
		rep.updateMenuClassification(menu);
	}
	// 메뉴 등록
	@Override
	public void insertMenu(MenuDTO menu) {
		System.out.println("isnertMenu @service : " + menu);
		rep.insertMenu(menu);
	}
	// 첨부파일 없는 메뉴 수정
	@Override
	public void modifingMenu(MenuDTO menu) {
		System.out.println("modifingMenu @service : " + menu);
		rep.updateMenu(menu);
	}
	// 첨부파일 있는 메뉴 수정
	@Override
	public void modifingMenuIncludeImg(MenuDTO menu) {
		System.out.println("modifingMenuImg @service : " + menu);
		rep.updateMenuIncludeImg(menu);
		
	}
	// 메뉴 삭제
	@Override
	public void deleteMenu(Integer menuCode) {
		System.out.println("deleteMenu @service");
		rep.deleteMenu(menuCode);
	}
	
	
	// 매장정보 탭
	// 매장정보 일부조회(매장이름, 평점, 리뷰수, 최소주문금액, 주소)
	@Override
	public StoreDTO selectStore(Integer storeCode) {
		System.out.println("storeCode @service : " + storeCode);
		System.out.println("selectStore @service");
		return rep.selectStoreInfo(storeCode);
	}
	// 사장님정보 일부조회(이름, 사업자등록번호)
	@Override
	public SellerDTO selectSeller(Integer sellerCode) {
		System.out.println("storeCode @service : " + sellerCode);
		System.out.println("selectSeller @service");
		return rep.selectSellerInfo(sellerCode);
	}
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	@Override
	public void modifingStoreDTA(StoreDTO store) {
		System.out.println("modifingStoreDTA @service : " + store);
		rep.updateStoreSubInfo(store);
	}	
	
	// 리뷰 탭
	// 리뷰 전체 조회
	@Override
	public List<ReviewDTO> selectAllReview(Integer storeCode) {
		System.out.println("selectAllReview @service");
		return rep.selectAllReview(storeCode);
	}
	// 가게 평점 평균
	@Override
	public double storeAvgRating(Integer storeCode) {
		System.out.println("storeAvgRating @service");
		return rep.storeAvgRating(storeCode);
	}
	// 리뷰 갯수 카운트
	@Override
	public int reviewCount(Integer storeCode) {
		System.out.println("reviewCount @service");
		return rep.reviewCount(storeCode);
	}

	// 답변 등록
	@Override
	public void updateAnswer(ReviewDTO reviewDTO) {
		System.out.println("isnertReview @service");
		rep.updateAnswer(reviewDTO);
	}
	@Override
	public List<AnswerDTO> selectAllAnswer(Integer reviewCode) {
		return rep.selectAllAnswer(reviewCode);
	}

	
	

	
	
	
	
	
}
