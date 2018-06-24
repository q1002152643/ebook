package com.ebook.manager.apis;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.manager.utils.EbookResult;

@FeignClient(name = "ebook-order")
public interface OrderService {

	@RequestMapping(value="/order/findAllOrderInfoByUidOrStatus",method=RequestMethod.GET)
	@ResponseBody
	EbookResult findAllOrderInfoByUidOrStatus(@RequestParam("uid") long uid,@RequestParam("status") int status,@RequestParam("id") long id);

	@RequestMapping(value="/order/updateOrderStatusById",method=RequestMethod.GET)
	@ResponseBody
	EbookResult updateOrderStatusById(@RequestParam("id") long id,@RequestParam("status") int status);
}