package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SellerDTO {

	int sellerRegCode;
	String sellerId;
	String sellerPw;
	String sellerName;
	String sellerPhone;
	String sellerEmail;
	String sellerBirth;
	int sellerGender;
	int sellerStatus;
}
