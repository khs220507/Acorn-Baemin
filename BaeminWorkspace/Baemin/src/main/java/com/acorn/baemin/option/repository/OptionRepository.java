package com.acorn.baemin.option.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;
@Repository
public class OptionRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceOption = "com.acorn.OptionMapper.";
	    private static String namespaceSeller = "com.acorn.SellerMapper.";
	    
	    public MenuDTO selectMenuInfo(String menuCode) {
	    	return session.selectOne(namespaceSeller+"selectMenuInfo",menuCode);
	    }
	    
	    public List<OptionDTO> userSelectOption(String menuCode) {
	    	return session.selectList(namespaceOption+"userSelectOption",menuCode);
	    }
	    
	    public List<OptionDTO> selectOption(String menuCode) {
	    	return session.selectList(namespaceOption+"selectOption",menuCode);
	    }
	    public List<OptionDTO> selectOptionUser(String menuCode) {
	    	return session.selectList(namespaceOption+"selectOptionUser",menuCode);
	    }
	    
	    public void insertOption (OptionDTO Option) {
	    	session.insert(namespaceOption+"insertOption", Option);
	    }
	    
	    public void deleteOption (String OptionCode) {
	    	session.insert(namespaceOption+"deleteOption", OptionCode);
	    }

	    public void deleteOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceOption+"deleteOptionCategory", Option);
	    }
	    
	    public List<OptionDTO> getCategoryAndSelectType(String menuCode) {
	    	return session.selectList(namespaceOption+"getCategoryAndSelectType",menuCode);
	    }
	    
	    public void updateOption (OptionDTO Option) {
	    	session.insert(namespaceOption+"updateOption", Option);
	    }
	    public void updateOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceOption+"updateOptionCategory", Option);
	    }
	    
	    



}