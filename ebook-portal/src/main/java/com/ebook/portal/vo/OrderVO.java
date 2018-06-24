package com.ebook.portal.vo;

import java.util.List;

import com.ebook.portal.pojo.Order;
import com.ebook.portal.pojo.OrderDetail;

import lombok.Getter;
import lombok.Setter;

public class OrderVO extends Order {

	private static final long serialVersionUID = -7289121705035859027L;

	@Getter
	@Setter
	List<OrderDetail> orderDetails;

}
