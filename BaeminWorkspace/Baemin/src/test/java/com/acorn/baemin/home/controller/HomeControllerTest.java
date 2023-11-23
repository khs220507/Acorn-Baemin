package com.acorn.baemin.home.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.home.repository.AddressRepositoryImp;
import com.acorn.baemin.home.repository.OrderRepositoryImp;
import com.acorn.baemin.home.repository.SearchRepositoryImp;
import com.acorn.baemin.home.repository.ZzimRepositoryImp;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/test.xml",
		"file:src/main/webapp/WEB-INF/spring/**/test2.xml" })
@Log4j
public class HomeControllerTest {

	@Autowired
	OrderRepositoryImp dao;

	@Autowired
	ZzimRepositoryImp zzimDAO;
	
	@Autowired
	SearchRepositoryImp searchDAO;
	
	@Autowired
	AddressRepositoryImp addressDAO;

	// @Test
	public void deleteTest() {
		log.info(dao.orderDelete(70004));
	}

	//@Test
	public void zzimSelectTest() throws Exception {
		zzimDAO.zzimSelectAll(10001).forEach(m -> log.info(m));
	}

	 //@Test
	public void searchListTest() throws Exception {
		log.info(searchDAO.searchStoresAndMenus("Pizza"));
	}
	
 	//@Test
	public void zzimCheck() throws Exception {
		ZzimDTO zz = new ZzimDTO(10002, 30002);
		System.out.println(zz);
		int zzz= zzimDAO.zzimCheck(zz);
		System.out.println(zzz);
	}
	
	@Test
	public void addressInsertTest() {
		AddressDTO address = new AddressDTO(0,10001, "고양시 일산서구", "강선마을 17단지",0);
		addressDAO.insertAddress(address);
	}

}
