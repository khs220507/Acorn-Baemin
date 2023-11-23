package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddressDTO {
	int addressCode;
	int userCode;
	String deliveryAddress;
	String detailDeliveryAddress;
	int addressStatus;
}
