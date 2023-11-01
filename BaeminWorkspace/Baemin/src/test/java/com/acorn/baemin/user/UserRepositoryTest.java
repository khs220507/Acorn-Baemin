package com.acorn.baemin.user;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/test.xml",
		"file:src/main/webapp/WEB-INF/spring/**/test2.xml" })
@Log4j
public class UserRepositoryTest {

	@Test
	public void test() {
		//fail("Not yet implemented");
	}

}
