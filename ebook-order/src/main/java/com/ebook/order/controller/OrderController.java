package com.ebook.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ebook.order.service.OrderService;
import com.ebook.order.utils.EbookResult;
import com.ebook.order.utils.ExceptionUtil;
import com.ebook.order.vo.OrderVO;

@RestController
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping("/create")
	public EbookResult createOrder(@RequestBody OrderVO orderVO) {
		try {

			return orderService.createOrder(orderVO);
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}

	@RequestMapping("/findAllOrderInfoByUidOrStatus")
	public EbookResult findAllOrderInfoByUidOrStatus(@RequestParam(required = false) long uid,
			@RequestParam(required = false) int status, @RequestParam(required = false) long id) {
		try {

			return orderService.findAllOrderInfoByUidOrStatus(uid, status, id);
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}

	@RequestMapping("/updateOrderStatusById")
	public EbookResult updateOrderStatusById(long id, int status) {
		try {

			return orderService.updateOrderStatusById(id, status);
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
}
