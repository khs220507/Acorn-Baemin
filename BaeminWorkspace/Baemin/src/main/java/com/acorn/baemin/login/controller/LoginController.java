package com.acorn.baemin.login.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.login.repository.LoginRepositoryI;
import com.acorn.baemin.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginRepositoryI rep;

	@Autowired
	private LoginService loginService;	

	// 로그인 보내기
		@GetMapping("/login")
		public String login(HttpSession session) {			
			String result = "user/login";
			String user = (String) session.getAttribute("user");
			Integer userCode = (Integer) session.getAttribute("userCode");
			System.out.println(user);
			// 세션확인
			if(user != null || userCode !=null) {	  // 로그인상태 	
				return "redirect:/home";
			}else {		
			  return result;
			}
		}
	
	// 손님 로그인 입력 정보 받아오기
	@PostMapping("/login")
	public String processLogin(String userId, String userPw, Model model, String logintype, HttpSession session) {
		System.out.println(userId + userPw + logintype);
		UserDTO user = loginService.loginCustomer(userId, userPw);
		if (user != null) {
			session.setAttribute("userCode", user.getUserCode());
			return "redirect:/home";
		} else {
			model.addAttribute("message", "로그인 실패. 로그인 유형과 계정 정보를 확인해주세요.");
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
			return "redirect:/sellerHome?sellerCode="+sellerCode;
		} else {
			model.addAttribute("message", "로그인 실패. 로그인 유형과 계정 정보를 확인해주세요.");
			return "user/login";			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(  HttpSession session) {
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

