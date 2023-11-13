package com.acorn.baemin.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.user.repository.UserRepository;
import com.acorn.baemin.user.repository.UserRepositoryI;
import com.acorn.baemin.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserRepositoryI rep;

	@Autowired
	UserRepository userrep;

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicate")
	public ResponseEntity<String> checkDuplicate(@RequestParam("userId") String userId) {
		System.out.println("중복확인");
		UserDTO user = new UserDTO();
		user.setUserId(userId);
		System.out.println("user" + userId);
		int count = userrep.checkDuplicateUserId(user);
		System.out.println(count + userId);
		if (count > 0) {
			return ResponseEntity.ok("yes");
		} else {
			return ResponseEntity.ok("no");
		}
	}

	// 내 정보 수정 시, 기존 정보 가져오기
	@RequestMapping("/selectUserInfo2")
	public String modifyInfo(Model model, @RequestParam("userCode") Integer userCode, HttpSession session) {
		try {
			System.out.println(userCode + "1");
			Integer userType = (Integer) session.getAttribute("userCode");

			System.out.println(userType + "2");

			// setAttribute("userCode", "dfkjdfkd");
			// setAttribute("sellerCode", "dkfkfkdkdf");

			if (userCode != null) { // customer인경우
				Object userInfo = rep.selectUserInfo(userCode, 1);
				
				System.out.println( "dfjdfjdfdf="+  userInfo);
				model.addAttribute("userInfo", userInfo);
				return "user/customer_modify";
			} else {
				Object userInfo = rep.selectUserInfo(userCode, 2);
				System.out.println( "dfjdfjdfdf="+  userInfo);
				model.addAttribute("userInfo", userInfo);
				return "user/seller_modify";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	// 내정보 수정 시, 손님 정보 가져오기
//	@RequestMapping("/selectCustomerInfo")
//	public String customermodify(Model model, @RequestParam("userCode") String userCode) {
//		UserDTO result;
//		try {
//			result = rep.selectCustomerInfo("10043");
//			model.addAttribute("modify", result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "user/customer_modify";
//	}

	// 내정보 수정 시, 사장님 정보 가져오기
//	@RequestMapping("/selectSellerInfo")
//	public String sellermodify(Model model) {
//		SellerDTO result2;
//		try {
//			result2 = rep.selectSellerInfo("20003");
//			model.addAttribute("modify2", result2);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "user/seller_modify";
//	}

	// 가입 유형 보내기
	@GetMapping("/select_signup")
	public String login() {
		return "user/select_signup";
	}

	// 손님 회원가입 페이지로 이동
	@GetMapping("/customer_signup")
	public String customerCreate() {
		return "user/customer_signup";
	}

	// 사장님 회원가입 페이지로 이동
	@GetMapping("/seller_signup")
	public String sellerCreate(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		return "user/seller_signup";
	}

	// 손님 회원 가입
	@ResponseBody
	@RequestMapping(value = "/customer_signup", method = RequestMethod.POST)
	public void insertUserSignup(@RequestBody UserDTO user) {
		userrep.insertCustomer(user);
	}

	// 사장님 회원 가입
	@ResponseBody
	@RequestMapping(value = "/seller_signup", method = RequestMethod.POST)
	public void insertSellerSignup(@RequestBody SellerDTO seller) {
		userrep.insertSeller(seller);
	}

	// 손님 정보 수정
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public String updateUserInfo(@RequestBody UserDTO userinfoupdate) {
		try {
			userrep.updateCustomer(userinfoupdate);
			return "수정 성공";
		} catch (Exception e) {
			return "수정 실패: " + e.getMessage();
		}
	}

	// 사장님 정보 수정
	@ResponseBody
	@RequestMapping(value = "/updateSellerInfo", method = RequestMethod.POST)
	public String updateSellerInfo(@RequestBody SellerDTO sellerinfoupdate) {
		try {
			userrep.updateSeller(sellerinfoupdate);
			return "수정 성공";
		} catch (Exception e) {
			return "수정 실패: " + e.getMessage();
		}
	}
}
