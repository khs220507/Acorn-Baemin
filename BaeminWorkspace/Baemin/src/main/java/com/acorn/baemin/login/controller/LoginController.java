package com.acorn.baemin.login.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
	public String processLogin(String userId, String userPw, Model model, String logintype, HttpServletRequest request) {
		System.out.println(userId + userPw + logintype);
		UserDTO user = loginService.login(userId, userPw);
		if (user != null) {
			
			HttpSession session = request.getSession();
			
			UserDTO userCode = rep.selectUserCode(userId);
			
			session.setAttribute("userCode", userCode);
			
			System.out.println("컨트롤러 : " +  session.getAttribute("userCode"));
			
			return "redirect:/home";
		} else {
			model.addAttribute("message", "�α��� ����. �α��� ������ ���� ������ Ȯ�����ּ���.");
			return "user/login";			
		}
	}
	
	//����� �α��� �Է� ���� �޾ƿ���
	@PostMapping("/login2")
	public String processLogin2(String userId, String userPw, Model model, String logintype) {
		SellerDTO seller = loginService.login2(userId, userPw);
		if (seller != null) {
			return "redirect:/home";
		} else {
			model.addAttribute("message", "�α��� ����. �α��� ������ ���� ������ Ȯ�����ּ���.");
			return "user/login";			
		}
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

