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

	//�α��� ������
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	//�մ� �α��� �Է� ���� �޾ƿ���
	@PostMapping("/login")
	public String processLogin(String userId, String userPw, Model model, String logintype, HttpSession session) {
		System.out.println(userId + userPw + logintype);
		UserDTO user = loginService.loginCustomer(userId, userPw);
		if (user != null) {
			session.setAttribute("userCode", user.getUserCode());
			return "redirect:/home";
		} else {
			model.addAttribute("message", "�α��� ����. �α��� ������ ���� ������ Ȯ�����ּ���.");
			return "user/login";			
		}
	}
	
	//����� �α��� �Է� ���� �޾ƿ���
	@PostMapping("/login2")
	public String processLogin2(String userId, String userPw, Model model, String logintype, HttpSession session) {
		SellerDTO seller = loginService.loginSeller(userId, userPw);
		if (seller != null) {
			int sellerCode = seller.getSellerCode();
			session.setAttribute("user", sellerCode);
			return "redirect:/sellerHome?sellerCode="+sellerCode;
		} else {
			model.addAttribute("message", "�α��� ����. �α��� ������ ���� ������ Ȯ�����ּ���.");
			return "user/login";			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/logout")
	public String logout(  HttpSession session) {
		   session.invalidate();
		   return "redirect:/home";	
	}
	
	
	
	// pull user_tbl
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

