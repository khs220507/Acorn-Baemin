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
	// 메뉴 수정
	@Override
	public int updateMenu(MenuDTO menu) {
		System.out.println("updateMenu @repo");
		return session.update(namespaceSeller + "updateMenu", menu);
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
		return session.selectList(namespaceReview + "selectAllReview");
	}
	// 답변 전체 조회
	@Override
	public List<AnswerDTO> selectAllAnswer(Integer reviewCode) {
		System.out.println("selectAllAnswer @repo");
		return session.selectList(namespaceAnswer + "selectAllAnswer");
	}
	// 답변 등록
	@Override
	public int insertAnswer(AnswerDTO answer) {
		System.out.println("insertAnswer @repo");
		return session.insert(namespaceAnswer + "insertAnswer", answer);
	}
	// 답변 수정
	@Override
	public int updateAnswer(AnswerDTO answer) {
		System.out.println("updateAnswer @repo");
		return session.update(namespaceAnswer + "updateAnswer", answer);
	}
	// 답변 삭제
	@Override
	public int deleteAnswer(AnswerDTO answer) {
		System.out.println("deleteAnswer @repo");
		return session.update(namespaceAnswer + "deleteAnswer", answer);
	}

	


}