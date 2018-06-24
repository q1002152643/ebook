package com.ebook.manager.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebook.manager.apis.OrderService;
import com.ebook.manager.utils.EbookResult;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/findAllOrderInfoByStatus", method = RequestMethod.GET)
	public String findAllOrderInfoByStatus(HttpServletRequest request,
			@RequestParam(value = "uid", required = false, defaultValue = "-1") long uid,
			@RequestParam(value = "status", required = false, defaultValue = "-1") int status) {
		EbookResult result = orderService.findAllOrderInfoByUidOrStatus(uid, status, -1);
		request.setAttribute("orderVO", result.getData());
		return "order-list";

	}

	@RequestMapping("/updateOrderStatusById")
	public String updateOrderStatusById(long id, int status, int preStatus) {

		orderService.updateOrderStatusById(id, status);
		return "/order/findAllOrderInfoByStatus?status=" + preStatus;
	}
}
