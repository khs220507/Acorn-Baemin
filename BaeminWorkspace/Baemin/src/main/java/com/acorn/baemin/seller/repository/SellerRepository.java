package com.acorn.baemin.seller.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.AnswerDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;

@Repository
public class SellerRepository implements SellerRepositoryI {
	@Autowired
	private SqlSession session;

	private static String namespaceSeller = "com.acorn.SellerMapper.";
	private static String namespaceReview = "com.acorn.ReviewMapper.";
	private static String namespaceAnswer = "com.acorn.AnswerMapper.";


	// 메뉴 탭
	// 메뉴 분류 조회(중복제거)
	@Override
	public List<MenuDTO> selectMenuClassification(Integer storeCode) {
		System.out.println("selectMenuClassification @repo");
		return session.selectList(namespaceSeller + "selectMenuClassification", storeCode);
	}
	// 메뉴 전체 조회
	@Override
	public List<MenuDTO> selectAllMenuInfo(Integer storeCode) {
		System.out.println("selectAllMenuInfo @repo");
		return session.selectList(namespaceSeller + "selectAllMenuInfo", storeCode);
	}
	// 메뉴 분류 수정
	@Override
	public int updateMenuClassification(MenuDTO menu) {
		System.out.println("updateMenuClassification @repo");
		return session.update(namespaceSeller + "updateMenuClassification", menu);
	}
	// 메뉴 등록
	@Override
	public int insertMenu(MenuDTO menu) {
		System.out.println("insertMenu @repo");
		return session.insert(namespaceSeller + "insertMenu", menu);
	}
	// 첨부파일 없는 메뉴 수정
	@Override
	public int updateMenu(MenuDTO menu) {
		System.out.println("updateMenu @repo : " + menu);
		return session.update(namespaceSeller + "updateMenu", menu);
	}
	// 첨부파일 있는 메뉴 수정
	@Override
	public int updateMenuIncludeImg(MenuDTO menu) {
		System.out.println("updateMenuIncludeImg @repo : " + menu);
		return session.update(namespaceSeller + "updateMenuIncludeImg", menu);
	}
	// 메뉴 삭제
	@Override
	public int deleteMenu(Integer menuCode) {
		System.out.println("deleteMenu @repo");
		return session.delete(namespaceSeller + "deleteMenu", menuCode);
	}
	
	// 매장정보 탭
	// 매장정보 조회
	@Override
	public StoreDTO selectStoreInfo(Integer storeCode) {
		System.out.println("storeCode @repo : " + storeCode);
		System.out.println("selectStoreInfo @repo");
		return session.selectOne(namespaceSeller + "selectStoreInfo", storeCode);
	}
	// 사장님정보 조회
	@Override
	public SellerDTO selectSellerInfo(Integer sellerCode) {
		System.out.println("sellerCode @repo : " + sellerCode);
		System.out.println("selectSellerInfo @repo");
		return session.selectOne(namespaceSeller + "selectSellerInfo", sellerCode);
	}
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	@Override
	public int updateStoreSubInfo(StoreDTO store) {
		System.out.println("updateStoreSubInfo @repo : " + store);
		return session.update(namespaceSeller + "updateStoreSubInfo", store);
	}
	
	// 리뷰 탭
	// 리뷰 전체 조회
	@Override
	public List<ReviewDTO> selectAllReview(Integer storeCode) {
		System.out.println("selectAllReview @repo");
		return session.selectList(namespaceReview + "selectAllReview", storeCode);
	}
	// 가게 평점 평균
	@Override
	public double storeAvgRating(Integer storeCode) {
		System.out.println("storeAvgRating @repo");
		double avgRating = session.selectOne(namespaceReview + "storeAvgRating", storeCode);
		return avgRating;
	}
	// 리뷰 갯수 카운트
	@Override
	public int reviewCount(Integer storeCode) {
		System.out.println("reviewCount @repo");
		int reviewCount = session.selectOne(namespaceReview + "reviewCount", storeCode);
        return reviewCount;
	}
	
	// 답변 등록
	@Override
	public int updateAnswer(ReviewDTO reviewDTO) {
		return session.insert(namespaceAnswer + "updateReview", reviewDTO);
	}
	@Override
	public List<AnswerDTO> selectAllAnswer(Integer reviewCode) {
		return session.selectList(namespaceAnswer + "getAnswersByReviewCode", reviewCode);
	}
	
	


}