package com.ebook.sso.ebooksso;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ImportResource;
import org.springframework.test.context.junit4.SpringRunner;

import com.ebook.order.mapper.OrderMapper;
import com.ebook.order.pojo.Order;
import com.ebook.order.utils.JsonUtils;

@RunWith(SpringRunner.class)
@SpringBootTest
@ImportResource({ "classpath:applicationContext-dao.xml" })
public class EbookSsoApplicationTests {

	@Autowired
	private OrderMapper orderMapper;

	@Test
	public void contextLoads() {
		orderMapper.insertSelective(JsonUtils.jsonToPojo(
				"{\"id\":15238667623581,\"payment\":225,\"status\":1,\"createTime\":1523866762358,\"updateTime\":NULL,\"uid\":1}",
				Order.class));
	}

}
