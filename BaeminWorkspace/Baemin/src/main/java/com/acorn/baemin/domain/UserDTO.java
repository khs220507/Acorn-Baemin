package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

	int userCode;
	String userId;
	String userPw;
	String userName;
	String userNickname;
	String userPhone;
	String userAdress;
	String userEmail;
	String userBirth;
	int userGender;
	int userStatus;
	
}
