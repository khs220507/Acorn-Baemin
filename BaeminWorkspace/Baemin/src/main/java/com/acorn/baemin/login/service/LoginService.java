package com.acorn.baemin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.login.repository.LoginRepository;
import com.acorn.baemin.login.repository.LoginRepositoryI;

@Service
public class LoginService {

//    @Autowired
//    private LoginRepositoryI loginRepositoryi;
	
	@Autowired
	private LoginRepository loginRepository;

    //손님 로그인
    public UserDTO loginCustomer(String userId, String userPw) {
        try {
            return loginRepository.login(userId, userPw);
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    //사장님 로그인
    public SellerDTO loginSeller(String sellerId, String sellerPw) {
        try {
            return loginRepository.loginseller(sellerId, sellerPw);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
  
}
