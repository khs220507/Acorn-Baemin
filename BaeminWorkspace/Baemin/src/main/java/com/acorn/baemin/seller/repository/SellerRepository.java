package com.acorn.baemin.seller.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


	// 태민
	// 메뉴 탭
	// 메뉴 전체 조회
	@Override
	public List<MenuDTO> selectAllMenuInfo() {
		System.out.println("selectMenuInfo @repo");
		return session.selectList(namespaceSeller + "selectMenuInfo");
	}
	// 매장정보 탭
	// 매장정보 일부조회1(매장이름, 매장평점, 리뷰수, 최소주문금액)
	@Override
	public StoreDTO selectStoreSubInfo1(int storeCode) {
		System.out.println("storeCode @repo : " + storeCode);
		System.out.println("selectStoreSubInfo1 @repo");
		return session.selectOne(namespaceSeller + "selectStoreSubInfo1", storeCode);
	}
	// 매장정보 일부조회2(가게소개, 운영시간, 매장주소)
	@Override
	public StoreDTO selectStoreSubInfo2(int storeCode) {
		System.out.println("storeCode @repo : " + storeCode);
		System.out.println("selectStoreSubInfo2 @repo");
		return session.selectOne(namespaceSeller + "selectStoreSubInfo2", storeCode);
	}
	// 사장님정보 일부조회(이름, 사업자등록번호)
	@Override
	public SellerDTO selectSellerSubInfo(int sellerCode) {
		System.out.println("sellerCode @repo : " + sellerCode);
		System.out.println("selectSellerSubInfo @repo");
		return session.selectOne(namespaceSeller + "selectSellerSubInfo", sellerCode);
	}
	// 매장정보 일부수정(가게소개, 운영시간, 매장주소)
	@Override
	public int updateStoreSubInfo(StoreDTO store) {
		System.out.println("updateStoreSubInfo @repo");
		return session.selectOne(namespaceSeller + "updateStoreSubInfo", store);
	}
	// 사장님정보 일부수정(이름, 사업자등록번호)
	@Override
	public int updateSellerSubInfo(SellerDTO seller) {
		System.out.println("repo : updateSellerSubInfo");
		return session.update(namespaceSeller + "updateSellerSubInfo", seller);
	}
	// 리뷰 탭
	// 리뷰 전체 조회
	@Override
	public List<ReviewDTO> selectAllReview() {
		System.out.println("selectAllReview @repo");
		return session.selectList(namespaceReview + "selectAllReview");
	}
	// 답변 등록
	@Override
	public int insertAnswer(String AnswerContent) {
		System.out.println("insertAnswer @repo");
		return session.insert(namespaceAnswer + "insertAnswer", AnswerContent);
	}
	// 답변 수정
	@Override
	public int updateAnswer(String AnswerContent) {
		System.out.println("updateAnswer @repo");
		return session.update(namespaceAnswer + "updateAnswer", AnswerContent);
	}
	// 답변 삭제
	@Override
	public int deleteAnswer(int AnswerCode) {
		System.out.println("deleteAnswer @repo");
		return session.delete(namespaceAnswer + "deleteAnswer", AnswerCode);
	}



}