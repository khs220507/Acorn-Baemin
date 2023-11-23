package com.acorn.baemin.user.controller;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.user.repository.UserRepositoryI;
import com.acorn.baemin.user.service.MailSendService;

@Controller
public class UserController {

	@Autowired
	UserRepositoryI rep;

	@Autowired
	MailSendService mailService;
	
	

	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck/{email}", method = RequestMethod.GET)
	public String mailCheck(@PathVariable String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	// 손님 연락처 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicatePhone")
	public String checkDuplicateuserphone(@RequestParam("userPhone") String userPhone) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + userPhone);
		int count = rep.checkDuplicateUserphone(userPhone);
		System.out.println(count + userPhone);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 사장님 연락처 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicatePhone2")
	public String checkDuplicateSellerphone(@RequestParam("sellerPhone") String sellerPhone) {
		System.out.println("중복확인");
		String result;
		System.out.println("seller" + sellerPhone);
		int count = rep.checkDuplicateSellerphone(sellerPhone);
		System.out.println(count + sellerPhone);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 사업자등록번호 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicateRegCode")
	public String checkDuplicateRegCode(@RequestParam("sellerRegCode") String sellerRegCode) {
		System.out.println("중복확인");
		String result;
		System.out.println("seller" + sellerRegCode);
		int count = rep.checkDuplicateSellerRegCode(sellerRegCode);
		System.out.println(count + sellerRegCode);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 손님 이메일 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicateEmail")
	public String checkDuplicateUseremail(@RequestParam("userEmail") String userEmail) {
		System.out.println("중복확인!!!!");
		String result;
		System.out.println("user" + userEmail);
		int count = rep.checkDuplicateUseremail(userEmail);
		System.out.println(count + userEmail);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 닉네임 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicateNick")
	public String checkDuplicateNick(@RequestParam("userNickname") String userNickname) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + userNickname);
		int count = rep.checkDuplicateNickname(userNickname);
		System.out.println(count + userNickname);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 손님 아이디 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicate")
	public String checkDuplicate(@RequestParam("userId") String userId) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + userId);
		int count = rep.checkDuplicateUserId(userId);
		System.out.println(count + userId);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	// 사장님 아이디 중복 확인
	@ResponseBody
	@PostMapping("/checkDuplicate2")
	public String checkDuplicate2(@RequestParam("sellerId") String sellerId) {
		System.out.println("중복확인");
		String result;
		System.out.println("user" + sellerId);
		int count = rep.checkDuplicateUserId2(sellerId);
		System.out.println(count + sellerId);
		if (count != 0) {
			result = "yes";
		} else {
			result = "no";
		}
		return result;
	}

	@PostMapping("/userinfo/checkPassword")
	public ResponseEntity<String> checkPassword(@RequestParam String userId, @RequestParam String password) {
		String storedPassword = rep.getPasswordByUserId(userId);

		if (storedPassword != null && storedPassword.equals(encryptPassword(password))) {
			return ResponseEntity.ok("Password Matched");
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("비밀번호 불일치");
		}
	}

	// 해시 함수를 사용하여 비밀번호를 암호화하는 메서드 (SHA-256 등)
	private String encryptPassword(String password) {
		// 비밀번호를 해싱하는 로직 구현 (예: SHA-256)
		// return hashedPassword;
		return password; // 실제 해싱 로직은 여기에 구현되어야 합니다.
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
				return "user/customer_modify";
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

	// 손님 회원 가입 이메일 자르기
	@ResponseBody
	@RequestMapping(value = "/customer_signup", method = RequestMethod.POST)
	public void insertUserSignup(@RequestBody UserDTO user) {

		System.out.println("dfdfd" + user);

		String email = user.getUserEmail(); // .com.com

		int index = email.lastIndexOf('.');
		if (index != -1) {
			email = email.substring(0, index);
			// System.out.println( "dfdfdfd" + email);
		}
		user.setUserEmail(email);
		// System.out.println( " u =" + user);
		rep.insertCustomer(user);
	}

	// 사장님 회원 가입 이메일 자르기
	@ResponseBody
	@RequestMapping(value = "/seller_signup", method = RequestMethod.POST)
	public void insertSellerSignup2(@RequestBody SellerDTO seller) {

		System.out.println("dfdfd" + seller);

		String email = seller.getSellerEmail(); // .com.com

		int index = email.lastIndexOf('.');
		if (index != -1) {
			email = email.substring(0, index);
			// System.out.println( "dfdfdfd" + email);
		}
		seller.setSellerEmail(email);
		// System.out.println( " u =" + user);
		rep.insertSeller(seller);
	}

//	// 사장님 회원 가입
//	@ResponseBody
//	@RequestMapping(value = "/seller_signup", method = RequestMethod.POST)
//	public void insertSellerSignup(@RequestBody SellerDTO seller) {
//		rep.insertSeller(seller);
//	}

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
			rep.updateCustomer(updatecustomer);
			System.out.println("success890");
			return "수정 성공";
		} catch (Exception e) {
			return "수정 실패: " + e.getMessage();
		}
	}

	// 사장님 정보 수정
	@ResponseBody
	@RequestMapping(value = "/updateSellerInfo", method = RequestMethod.POST)
	public String updateSellerInfo(@RequestBody SellerDTO updateseller, HttpSession session) {
		System.out.println("success889");
		Integer sellerCode = (Integer) session.getAttribute("user");
		updateseller.setSellerCode(sellerCode);
		System.out.println("success890");
		try {
			System.out.println("success891");
			rep.updateSeller(updateseller);
			System.out.println("success892");
			return "수정 성공";
		} catch (Exception e) {
			return "수정 실패: " + e.getMessage();
		}
	}
	
	// 손님 회원 탈퇴
	@RequestMapping(value = "/customerSignoutStatus", method = RequestMethod.GET)
	public String UserSignOutStatus(HttpSession session) {
		Integer userCode = (Integer) session.getAttribute("userCode");
		System.out.println("userCode"+ userCode);
		if (userCode != null) {
			rep.signoutUser(userCode);
			session.invalidate();
		} else {
			System.out.println("망함" + userCode);
		}

		return "redirect:/home";
	}	
	
	// 사장님 회원 탈퇴
	@RequestMapping(value = "/sellerSignoutStatus", method = RequestMethod.GET)
	public String SellerSignOutStatus(HttpSession session) {
		Integer sellerCode = (Integer) session.getAttribute("user");
		System.out.println("sellerCode"+ sellerCode);
		if (sellerCode != null) {
			rep.signoutSeller(sellerCode);
			session.invalidate();
		} else {
			System.out.println("망함" + sellerCode);
		}

		return "redirect:/home";
	}	// 홈화면 리다이렉트 후 페이지 이동 에러

}
