package com.acorn.baemin.login.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.login.repository.LoginRepository;
import com.acorn.baemin.login.repository.LoginRepositoryI;
import com.acorn.baemin.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginRepositoryI rep;

	@Autowired
	LoginRepository lr;

	@Autowired
	private LoginService loginService;

		
	
	
	// 손님 비밀번호 초기화
    @PostMapping("/reset/customer")
    public ResponseEntity<String> resetCustomerPassword(@RequestParam String userEmail) {
        int rowsAffected = lr.resetCustomerPassword(Collections.singletonMap("userEmail", userEmail));

        if (rowsAffected > 0) {
            return ResponseEntity.ok("Password reset successfully for customer.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to reset password for customer.");
        }
    }

    // 사장님 비밀번호 초기화
    @PostMapping("/reset/seller")
    public ResponseEntity<String> resetSellerPassword(@RequestParam String sellerEmail) {
        int rowsAffected = lr.resetSellerPassword(Collections.singletonMap("sellerEmail", sellerEmail));

        if (rowsAffected > 0) {
            return ResponseEntity.ok("Password reset successfully for seller.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to reset password for seller.");
        }
    }
    
    	// 유저 비밀번호 찾기 보내기
 		@GetMapping("/findPwForm")
 		public String findPwForm() {
 			return "user/findPwForm";
 		}
 		
 		// 유저 비밀번호 찾기 받기
 		@PostMapping("/findPw")
 		public String findPw(@RequestParam String Id, String email, Model model) {
 			Map<String, Object> params = new HashMap<>();
 			params.put("userId", Id);
 			params.put("userEmail", email);
 			params.put("sellerId", Id);
 			params.put("sellerEmail", email);

 			String customerPw = rep.findCustomerPassword(params);
 			String sellerPw = rep.findSellerPassword(params);

 			model.addAttribute("customerPw", customerPw);
 			model.addAttribute("sellerPw", sellerPw);

 			return "user/findPwResult";
 		}

 // 손님 비밀번호 찾기
//    @PostMapping("/findPw")
//    public ResponseEntity<String> retrieveUserPassword(@RequestParam String userId, @RequestParam String userEmail) {
//        Map<String, Object> params = new HashMap<>();
//        params.put("userId", userId);
//        params.put("userEmail", userEmail);
//
//        String userPassword = lr.findCustomerPassword(params);
//
//        if (userPassword != null) {
//            return ResponseEntity.ok("손님 비밀번호 : " + userPassword);
//        } else {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Password not found for user.");
//        }
//    }
//
//    // 사장님 비밀번호 찾기
//    @PostMapping("/retrieve/seller")
//    public ResponseEntity<String> retrieveSellerPassword(@RequestParam String sellerId, @RequestParam String sellerEmail) {
//        Map<String, Object> params = new HashMap<>();
//        params.put("sellerId", sellerId);
//        params.put("sellerEmail", sellerEmail);
//
//        String sellerPassword = lr.findSellerPassword(params);
//
//        if (sellerPassword != null) {
//            return ResponseEntity.ok("사장님 비밀번호 : " + sellerPassword);
//        } else {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Password not found for seller.");
//        }
//    }

	
	
	
	
	
	
	
	
	// 유저 아이디 찾기 보내기
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "user/findIdForm";
	}

	// 유저 아이디 찾기 받기
	@PostMapping("/findId")
	public String findId(@RequestParam String email, Model model) {
		Map<String, Object> params = new HashMap<>();
		params.put("userEmail", email);
		params.put("sellerEmail", email);

		String customerId = rep.findCustomerId(params);
		String sellerId = rep.findSellerId(params);

		model.addAttribute("customerId", customerId);
		model.addAttribute("sellerId", sellerId);

		return "user/findIdResult";
	}
	
	

	// 유저 로그인 보내기
	@GetMapping("/login")
	public String login(HttpSession session) {
		String result = "user/login";
		String user = (String) session.getAttribute("user");
		Integer userCode = (Integer) session.getAttribute("userCode");
		System.out.println(user);
		// 세션확인
		if (user != null || userCode != null) { // 로그인상태
			return "redirect:/home";
		} else {
			return result;
		}
	}

	// 손님 로그인 입력 정보 받아오기
	@PostMapping("/login")
	public String processLogin(String userId, String userPw, Model model, String logintype, HttpSession session) {
		System.out.println(userId + userPw + logintype);
		try {
			UserDTO user = loginService.loginCustomer(userId, userPw);
			if (user != null) {
				session.setAttribute("userCode", user.getUserCode());
				session.setAttribute("user", user.getUserId());
				return "redirect:/home";
			} else {
				model.addAttribute("message", "로그인 실패. 로그인 유형과 계정 정보를 확인해주세요.");
				return "user/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "로그인 중 오류가 발생했습니다.");
			return "user/login";
		}
	}

	// 사장님 로그인 입력 정보 받아오기
	@PostMapping("/login2")
	public String processLogin2(String userId, String userPw, Model model, String logintype, HttpSession session) {
		SellerDTO seller = loginService.loginSeller(userId, userPw);
		if (seller != null) {
			int sellerCode = seller.getSellerCode();
			session.setAttribute("user", sellerCode);
			return "redirect:/sellerHome?sellerCode=" + sellerCode;
		} else {
			model.addAttribute("message", "로그인 실패. 로그인 유형과 계정 정보를 확인해주세요.");
			return "user/login";
		}
	}

	// 유저 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}

	// 손님 테이블 전체 조회
	@RequestMapping("/selectAll")
	public String main(Model model) {
		List<UserDTO> result;
		try {
			result = rep.selectAll();
			model.addAttribute("list", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "user/login";
	}



}