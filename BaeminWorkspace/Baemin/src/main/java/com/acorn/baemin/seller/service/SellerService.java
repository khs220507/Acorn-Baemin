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
public class SellerService implements SellerServiceI{
	
	@Autowired
	SellerRepository rep;
	
	// 태민
	// 메뉴 탭
	// 메뉴 분류 조회(중복제거)
	@Override
	public List<MenuDTO> selectMenuClassification() {
		System.out.println("selectMenuClassification @service");
		List<MenuDTO> CList = rep.selectMenuClassification();
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
	public void modifingMenuClassification(String menuClassification) {
		System.out.println("menuClassification @service : " + menuClassification);
		rep.updateMenuClassification(menuClassification);
	}
	// 메뉴 등록
	@Override
	public void insertMenu(MenuDTO menu) {
		System.out.println("isnertMenu @service");
		rep.insertMenu(menu);
	}
	// 메뉴 수정
	@Override
	public void modifingMenu(MenuDTO menu) {
		System.out.println("modifingMenu @service");
		rep.updateMenu(menu);
	}
	// 메뉴 삭제
	@Override
	public void deleteMenu(Integer menuCode) {
		System.out.println("deleteMenu @service");
		rep.deleteMenu(menuCode);
	}
	// 매장정보 탭
	// 매장정보 일부조회1(매장이름, 평점, 리뷰수, 최소주문금액)
	@Override
	public StoreDTO selectStore(int storeCode) {
		System.out.println("storeCode @service : " + storeCode);
		System.out.println("selectStore @service");
		return rep.selectStoreInfo(storeCode);
	}
	// 사장님정보 일부조회(이름, 사업자등록번호)
	@Override
	public SellerDTO selectSeller(int sellerCode) {
		System.out.println("storeCode @service : " + sellerCode);
		System.out.println("selectSeller @service");
		return rep.selectSellerInfo(sellerCode);
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
	public void insertAnswer(String answerContent) {
		System.out.println("isnertReview @service");
		rep.insertAnswer(answerContent);
	}
	// 답변 수정
	@Override
	public void updateAnswer(String answerContent) {
		System.out.println("updateReview @service");
		rep.updateAnswer(answerContent);
	}
	// 답변 삭제
	@Override
	public void deleteAnswer(int answerCode) {
		System.out.println("deleteReview @service");
		rep.deleteAnswer(answerCode);
	}
	
	

	
	
	
	
	
}
