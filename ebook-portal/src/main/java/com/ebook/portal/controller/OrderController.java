package com.ebook.portal.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ebook.portal.pojo.CartBook;
import com.ebook.portal.pojo.OrderDetail;
import com.ebook.portal.pojo.User;
import com.ebook.portal.service.OrderService;
import com.ebook.portal.utils.EbookResult;
import com.ebook.portal.utils.JsonUtils;
import com.ebook.portal.vo.OrderVO;

@Controller
@RequestMapping("/order")
public class OrderController {

	public static final String REDIS_CART_KEY = "REDIS_CART_KEY";

	@Autowired
	private StringRedisTemplate redisTemplate;

	@Autowired
	private OrderService orderService;

	private Integer getTotal(List<CartBook> list) {
		Integer sum = 0;
		for (CartBook cartBook : list) {
			sum += cartBook.getPrice() * cartBook.getNum();
		}
		return sum;

	}

	@GetMapping(value = "/createOrder")
	public String createOrder(HttpServletRequest request) {
		User user = (User) request.getAttribute("user");
		String key = REDIS_CART_KEY + ":" + user.getId();
		List<CartBook> list = null;

		try {
			String json = redisTemplate.opsForValue().get(key);
			// 判断是否为空
			if (StringUtils.isEmpty(json)) {
				list = new ArrayList<>();
			} else {
				list = JsonUtils.jsonToList(json, CartBook.class);
			}
			Integer total = this.getTotal(list);

			OrderVO orderVO = new OrderVO();
			long orderId = Long.parseLong(System.currentTimeMillis() + "" + user.getId());

			// 补全订单信息
			orderVO.setUid(user.getId());
			orderVO.setPayment(total);
			orderVO.setStatus(1);
			orderVO.setCreateTime(new Date());
			orderVO.setId(orderId);

			// 补全订单详细信息
			List<OrderDetail> orderDetails = new ArrayList<>();
			OrderDetail orderDetail = null;
			for (CartBook cartBook : list) {
				orderDetail = new OrderDetail();
				BeanUtils.copyProperties(cartBook, orderDetail);
				orderDetail.setId(null);
				orderDetail.setOid(orderId);
				orderDetail.setBid(cartBook.getId());
				orderDetails.add(orderDetail);
			}

			orderVO.setOrderDetails(orderDetails);

			// 调用订单系统进行下单
			orderService.createOrder(orderVO);

			redisTemplate.delete(key);
			return "redirect:/order/toSuccess?orderId=" + orderId + "&total=" + total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping(value = "/toSuccess")
	public String toSuccess(String orderId, String total, HttpServletRequest request) {
		if (StringUtils.isNoneBlank(orderId, total)) {
			request.setAttribute("orderId", orderId);
			request.setAttribute("total", total);
			return "home/success";
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/findAllOrderInfoByUid", method = RequestMethod.GET)
	public String findAllOrderInfoByUid(HttpServletRequest request) {
		Long uid = ((User) request.getAttribute("user")).getId();
		EbookResult result = orderService.findAllOrderInfoByUidOrStatus(uid, -1, -1);
		request.setAttribute("orderVO", result.getData());
		return "home/order-list";

	}

	@RequestMapping("/updateOrderStatusById")
	public String updateOrderStatusById(long id, int status) {

		orderService.updateOrderStatusById(id, status);
		return "redirect:/order/findAllOrderInfoByUid";
	}

	@RequestMapping(value = "/findOrderDetailInfo", method = RequestMethod.GET)
	public String findOrderDetailInfo(HttpServletRequest request, long id) {
		EbookResult result = orderService.findAllOrderInfoByUidOrStatus(-1, -1, id);
		Object data = ((List) result.getData()).get(0);
		request.setAttribute("orderVO", data);
		return "home/order-detail";

	}
}
