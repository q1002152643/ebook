package com.ebook.order.vo;

import java.util.List;

import com.ebook.order.pojo.Order;
import com.ebook.order.pojo.OrderDetail;

import lombok.Getter;
import lombok.Setter;

public class OrderVO extends Order {

	private static final long serialVersionUID = -7289121705035859027L;

	@Getter
	@Setter
	List<OrderDetail> orderDetails;

}
