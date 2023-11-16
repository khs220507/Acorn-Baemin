package com.acorn.baemin.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class UserController {

	@Autowired
	UserRepositoryI rep;

	@Autowired
	UserRepository userrep;

	// 손님 아이디 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicate")
	public String checkDuplicate(@RequestParam("userId") String userId) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + userId);
		int count = userrep.checkDuplicateUserId(userId);
		System.out.println(count + userId);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

//  사장님 아이디 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicate2")
	public String checkDuplicate2(@RequestParam("sellerId") String sellerId) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + sellerId);
		int count = userrep.checkDuplicateUserId2(sellerId);
		System.out.println(count + sellerId);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 손님 닉네임, 연락처, 이메일 중복 확인
	@PostMapping("/checkForDuplicates")
	@ResponseBody
	public Map<String, Long> checkForDuplicates(@RequestParam("nickname") String nickname,
			@RequestParam("phone") String phone, @RequestParam("email") String email) {
		return userrep.checkForDuplicates(nickname, phone, email);
	}

	// 내 정보 수정 시, 기존 정보 가져오기 손님
	@RequestMapping("/selectUserInfo2")
	public String modifyInfo(Model model, @RequestParam("userCode") Integer userCode, HttpSession session) {
		try {
			Integer userType = (Integer) session.getAttribute("userCode");
			System.out.println(userType + "2");

			if (userCode != null) {
				Object userInfo = rep.selectUserInfo(userCode, 1);

				System.out.println("aaaaaa=" + userInfo);
				model.addAttribute("userInfo", userInfo);
				return "user/customer_modify"; // 여기서 customer_modify 페이지로 이동
			} else {

				model.addAttribute("message", "유저 코드가 유효하지 않습니다.");
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "사용자 정보를 불러오는 중 오류가 발생했습니다.");
			return "error";
		}
	}

	// 내 정보 수정 시, 기존 정보 가져오기 사장님
	@RequestMapping("/selectUserInfo3")
	public String modifyInfo3(Model model, @RequestParam("userCode") Integer userCode, HttpSession session) {
		System.out.println(" selectUserInfo3" + userCode);
		
		try {
			
			Integer userType = (Integer) session.getAttribute("user");
			
			
			System.out.println(userType + "2");

			if (userCode != null) {
				Object userInfo = rep.selectUserInfo(userCode, 2);

				System.out.println("bbbbbb=" + userInfo);
				model.addAttribute("userInfo", userInfo);
				return "user/seller_modify";
			} else {

				model.addAttribute("message", "유저 코드가 유효하지 않습니다.");
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "사용자 정보를 불러오는 중 오류가 발생했습니다.");
			return "error";
		}
	}

//	@RequestMapping("/selectUserInfo2")
//	public String modifyInfo(Model model, @RequestParam("userCode") Integer userCode, HttpSession session) {
//		try {
//			Integer userType = (Integer) session.getAttribute("userCode");
//			System.out.println(userType + "2");
//
//			if (userCode != null) {
//				Object userInfo = rep.selectUserInfo(userCode, 1);
//
//				System.out.println("aaaaaa=" + userInfo);
//				model.addAttribute("userInfo", userInfo);
//				return "user/customer_modify";
//			} else {
//				Object userInfo = rep.selectUserInfo(userCode, 2);
//				System.out.println("bbbbbbb=" + userInfo);
//				model.addAttribute("userInfo", userInfo);
//				return "user/seller_modify";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("message", "사용자 정보를 불러오는 중 오류가 발생했습니다.");
//			return "error";
//		}
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
	public String updateUserInfo(@RequestBody UserDTO updatecustomer, HttpSession session) {
		System.out.println("success1");

		Integer userCode = (Integer) session.getAttribute("userCode");
		updatecustomer.setUserCode(userCode);

		System.out.println("dkfkfkfkffkfk" + updatecustomer);
		try {
			System.out.println("success899");
			userrep.updateCustomer(updatecustomer);
			System.out.println("success890");
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

//	// 손님 정보 수정
//	@ResponseBody
//	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
//	public String updateUserInfo(@RequestBody UserDTO updatecustomer, HttpSession session) {
//		
//		try {
//			Integer userCode = updatecustomer.getUserCode();
//			System.out.println("success1");
//			System.out.println("dkdkdkdkdkdkdkdk" + updatecustomer);
//		
//			if(userCode != null) {
//				
//				userrep.updateCustomer(updatecustomer);
//				System.out.println("success890");
//				return "수정성공.";
//			}else {
//				return "수정실패 : 사용자 정보가 없습니다.";
//			}				
//		}catch(Exception e) {
//			e.printStackTrace();
//			return "수정실패 : " + e.getMessage();
//		}
//	}
}