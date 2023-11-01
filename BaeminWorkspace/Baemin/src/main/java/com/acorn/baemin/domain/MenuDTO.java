package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

	int menuCode;
	String menuName;
	int menuPrice;
	String menuImage;
	String menuContent;
	String menuClassification;
	int menuStatus;
}
