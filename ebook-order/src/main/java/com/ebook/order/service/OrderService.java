package com.ebook.order.service;

import com.ebook.order.utils.EbookResult;
import com.ebook.order.vo.OrderVO;

public interface OrderService {
	EbookResult createOrder(OrderVO orderVO);

	EbookResult updateOrderStatusById(long id,int status);

	EbookResult findAllOrderInfoByUidOrStatus(Long uid,Integer status,Long id);
}
