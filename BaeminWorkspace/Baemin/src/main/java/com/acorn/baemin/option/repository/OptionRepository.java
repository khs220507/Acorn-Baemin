package com.acorn.baemin.option.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;
@Repository
public class OptionRepository implements OptionRepositoryI {
		@Autowired
		private SqlSession session;

	    private static String namespaceOption = "com.acorn.OptionMapper.";
	    private static String namespaceSeller = "com.acorn.SellerMapper.";
	    
	    @Override
	    public MenuDTO selectMenuInfo(String menuCode) {
	    	return session.selectOne(namespaceSeller+"selectMenuInfo",menuCode);
	    }

	    @Override
	    public List<OptionDTO> userSelectOption(String menuCode) {
	    	return session.selectList(namespaceOption+"userSelectOption",menuCode);
	    }
	    
	    @Override
	    public List<OptionDTO> selectOption(String menuCode) {
	    	return session.selectList(namespaceOption+"selectOption",menuCode);
	    }
	    
	    @Override
	    public List<OptionDTO> selectOptionUser(String menuCode) {
	    	return session.selectList(namespaceOption+"selectOptionUser",menuCode);
	    }
	    
	    @Override
	    public void insertOption (OptionDTO Option) {
	    	session.insert(namespaceOption+"insertOption", Option);
	    }
	    
	    @Override
	    public void deleteOption (String OptionCode) {
	    	session.insert(namespaceOption+"deleteOption", OptionCode);
	    }

	    @Override
	    public void deleteOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceOption+"deleteOptionCategory", Option);
	    }
	    
	    @Override
	    public List<OptionDTO> getCategoryAndSelectType(String menuCode) {
	    	return session.selectList(namespaceOption+"getCategoryAndSelectType",menuCode);
	    }
	    
	    @Override
	    public void updateOption (OptionDTO Option) {
	    	session.insert(namespaceOption+"updateOption", Option);
	    }
	    
	    @Override
	    public void updateOptionCategory (OptionDTO Option) {
	    	session.insert(namespaceOption+"updateOptionCategory", Option);
	    }
	    
	    
	    



}