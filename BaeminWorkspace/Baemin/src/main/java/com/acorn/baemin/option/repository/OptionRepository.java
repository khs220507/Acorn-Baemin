package com.acorn.baemin.option.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.OptionDTO;
@Repository
public class OptionRepository  {
		@Autowired
		private SqlSession session;

	    private static String namespaceStore = "com.acorn.OptionMapper.";
	
	    public List<OptionDTO> selectOption(String menuCode) {
	    	return session.selectList(namespaceStore+"selectOption",menuCode);
	    }
	    public List<OptionDTO> selectOptionUser(String menuCode) {
	    	return session.selectList(namespaceStore+"selectOptionUser",menuCode);
	    }
	    
	    public void insertOption (OptionDTO Option) {
	    	session.insert(namespaceStore+"insertOption", Option);
	    }
	    
	    public void deleteOption (String OptionCode) {
	    	session.insert(namespaceStore+"deleteOption", OptionCode);
	    }

	    public void deleteOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceStore+"deleteOptionCategory", Option);
	    }
	    
	    public List<OptionDTO> getCategoryAndSelectType(String menuCode) {
	    	return session.selectList(namespaceStore+"getCategoryAndSelectType",menuCode);
	    }
	    
	    public void updateOption (OptionDTO Option) {
	    	session.insert(namespaceStore+"updateOption", Option);
	    }
	    public void updateOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceStore+"updateOptionCategory", Option);
	    }
	    
	    



}