package com.acorn.baemin.user.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;

public interface UserRepositoryI {

	public UserDTO selectCustomerInfo(String selone) throws Exception;

	public SellerDTO selectSellerInfo(String selone2) throws Exception;

	// 손님 가입
	public void insertCustomer(UserDTO insertcustomer);

	// 사장님 가입
	public void insertSeller(SellerDTO insertseller);

	// 내정보수정시, 손님 비번 재확인
	String getPasswordByUserId(String userId);

	// 손님 정보수정
	public void updateCustomer(UserDTO updatecustomer);

	// 사장님 정보수정
	public void updateSeller(SellerDTO updateseller);

	// 손님 연락처 중복 확인
	public int checkDuplicateUserphone(String userPhone);

	// 사장님 연락처 중복 확인
	public int checkDuplicateSellerphone(String sellerPhone);

	// 손님 이메일 중복 확인
	public int checkDuplicateUseremail(String userEmail);

	// 사장님 이메일 중복 확인
	public int checkDuplicateSelleremail(String sellerEmail);

	// 닉네임 중복 확인
	public int checkDuplicateNickname(String userNickname);

	// 손님 아이디 중복 확인
	public int checkDuplicateUserId(String userId);

	// 사장님 아이디 중복 확인
	public int checkDuplicateUserId2(String sellerId);

	// 사업자 등록번호 중복 확인
	public int checkDuplicateSellerRegCode(String sellerRegCode);

	// 사장님 회원탈퇴
	public void signoutSeller(int sellerSignOut);
	
	// 손님 회원탈퇴
	public void signoutUser(int userSignOut);

	// 손님 닉네임, 연락처, 이메일 중복 확인
	Map<String, Long> checkForDuplicates(@Param("nickname") String nickname, @Param("phone") String phone,
			@Param("email") String email);

	Object selectUserInfo(Integer userCode, Integer userType) throws Exception;

}