package com.acorn.baemin.home.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.baemin.home.repository.OrderRepository;
import com.acorn.baemin.home.repository.ZzimRepository;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/test.xml" , "file:src/main/webapp/WEB-INF/spring/**/test2.xml"} )
@Log4j
public class HomeControllerTest {

	@Autowired
	OrderRepository dao;
	
	@Autowired
	ZzimRepository zzimDAO;
	
	//@Test
	public void deleteTest() {
		log.info( dao.orderDelete( 70004) );
	}

	@Test
	public void zzimSelectTest() throws Exception {
		zzimDAO.zzimSelectAll(10001).forEach(m -> log.info(m));
	}
}
