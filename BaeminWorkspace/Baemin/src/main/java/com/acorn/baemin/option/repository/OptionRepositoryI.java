package com.acorn.baemin.option.repository;

import java.util.List;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;

public interface OptionRepositoryI {
	
	public MenuDTO selectMenuInfo(String menuCode);
	
	public List<OptionDTO> userSelectOption(String menuCode);
	
	public List<OptionDTO> selectOption(String menuCode);
	
	public List<OptionDTO> selectOptionUser(String menuCode);
	
	public void insertOption (OptionDTO Option);
	
	public void deleteOption (String OptionCode);
	
	public void deleteOptionCategory (OptionDTO Option);
	
	public List<OptionDTO> getCategoryAndSelectType(String menuCode);
	
	public void updateOption (OptionDTO Option);	
	
	public void updateOptionCategory (OptionDTO Option);
	
}
