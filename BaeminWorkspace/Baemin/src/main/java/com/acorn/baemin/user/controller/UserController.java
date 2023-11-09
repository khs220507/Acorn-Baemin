package com.acorn.baemin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

	// 손님 정보 생성 페이지로 이동
	@GetMapping("/customer_signup")
	public String customerCreate() {
		return "user/customer_signup";
	}	

	// 사장님 정보 생성 페이지로 이동
	@GetMapping("/seller_signup")
	public String sellerCreate(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		return "user/seller_signup";
	}	
			
		// 손님 가입
		/*@ResponseBody
		@RequestMapping(value = "/customer_signup", method = RequestMethod.POST)
		public String customer_signup(String userId, String userPw, String userName, String userNickname,
		        String userPhone, String userEmail, String userBirth, int userGender,
		        String userPostCode, String userAddress, String userAddressDetail, String confirmPassword) {
		    System.out.println("1");
		    if(confirmPassword == userPw ) {
		    	UserDTO user = new UserDTO(0, userId, userPw, userName, userNickname, userPhone, userEmail, userBirth, userGender, userPostCode, userAddress, userAddressDetail, 0);
		    	
		    	System.out.println("2");
		    	userrep.insertCustomer(user);
		    	System.out.println("3");
		    	
		    }
		    
		    return "ok";
		}*/
// 손님 회원 가입
		@ResponseBody
		@RequestMapping(value="/customer_signup", method=RequestMethod.POST)
		public void insertUserSignup(@RequestBody UserDTO user) {
			userrep.insertCustomer(user);
		}
		
// 사장님 회원 가입		
		@ResponseBody
		@RequestMapping(value="/seller_signup", method=RequestMethod.POST)
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

	
	
	
	
	

