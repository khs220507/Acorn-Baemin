package com.acorn.baemin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	// pull selectCustomerInfo
	@RequestMapping("/selectCustomerInfo")
	public String customermodify(Model model) {
		UserDTO result;
		try {
			result = rep.selectCustomerInfo("10002");
			model.addAttribute("modify", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/customer_modify";
	}

	// pull selectSellerInfo
	@RequestMapping("/selectSellerInfo")
	public String sellermodify(Model model) {
		SellerDTO result2;
		try {
			result2 = rep.selectSellerInfo("20003");
			model.addAttribute("modify2", result2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/seller_modify";
	}

	// 가입 유형 보내기
	@GetMapping("/select_signup")
	public String login() {
		return "user/select_signup";
	}

	// 사용자 정보 생성 페이지로 이동
	@GetMapping("/customerCreate")
	public String customerCreate(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		return "user/customer_create";
	}	

	
	
	
	
	// 손님 가입
    @RequestMapping(value = "/customer_signup", method = RequestMethod.POST)
    public String customer_signup(String userId, String userPw, String userName,String userNickname,
    		String userPhone, String userEmail,	String userBirth, int userGender,
    		String userPostCode, String userAddress, String userAddressDetail) {
    	
//        UserDTO user = new UserDTO(userId, userPw, userName, userNickname,
//        		userPhone, userEmail, userBirth, userGender,
//        		userPostCode, userAddress, userAddressDetail);
                
//        userrep.insertUser(user);

        return "redirect:/home"; // 홈으로 이동
    }

    


	
}

	
	
	
	
	

