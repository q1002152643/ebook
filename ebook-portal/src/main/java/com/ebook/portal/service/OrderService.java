package com.ebook.portal.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.utils.EbookResult;
import com.ebook.portal.vo.OrderVO;

@FeignClient(name = "ebook-order")
public interface OrderService {

	@RequestMapping(value="/order/create",method=RequestMethod.GET)
	@ResponseBody
	EbookResult createOrder(@RequestBody OrderVO orderVO);

	@RequestMapping(value="/order/findAllOrderInfoByUidOrStatus",method=RequestMethod.GET)
	@ResponseBody
	EbookResult findAllOrderInfoByUidOrStatus(@RequestParam("uid") long uid,@RequestParam("status") int status,@RequestParam("id") long id);

	@RequestMapping(value="/order/updateOrderStatusById",method=RequestMethod.GET)
	@ResponseBody
	EbookResult updateOrderStatusById(@RequestParam("id") long id,@RequestParam("status") int status);
}