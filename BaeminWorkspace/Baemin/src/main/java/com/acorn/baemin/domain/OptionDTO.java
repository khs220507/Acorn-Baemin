package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OptionDTO {

	
	public int optionCode;
    public int menuCode;
    public String optionCategory;
    public int optionSelectType;
    public String optionName;
    public int optionPrice;
    public int optionStatus;
}
