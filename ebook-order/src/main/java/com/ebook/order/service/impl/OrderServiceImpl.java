package com.ebook.order.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebook.order.mapper.OrderDetailMapper;
import com.ebook.order.mapper.OrderMapper;
import com.ebook.order.pojo.Order;
import com.ebook.order.pojo.OrderDetail;
import com.ebook.order.service.OrderService;
import com.ebook.order.utils.EbookResult;
import com.ebook.order.vo.OrderVO;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderDetailMapper orderDetailMapper;

	@Override
	public EbookResult createOrder(OrderVO orderVO) {

		Order order = new Order();
		BeanUtils.copyProperties(orderVO, order);
		orderMapper.insertSelective(order);

		List<OrderDetail> orderDetails = orderVO.getOrderDetails();
		for (OrderDetail orderDetail : orderDetails) {
			orderDetailMapper.insertSelective(orderDetail);
		}
		return EbookResult.ok();
	}

	@Override
	public EbookResult updateOrderStatusById(long id, int status) {
		Order order = new Order();
		order.setId(id);
		order.setStatus(status);
		orderMapper.updateByPrimaryKeySelective(order);
		return EbookResult.ok();
	}

	@Override
	public EbookResult findAllOrderInfoByUidOrStatus(Long uid, Integer status, Long id) {
		OrderVO orderVO = null;
		List<OrderVO> list = new ArrayList<>();

		Example example = new Example(Order.class);
		example.setOrderByClause("create_time desc");
		Criteria criteria = example.createCriteria();
		if (uid != -1) {
			criteria.andEqualTo("uid", uid);
		}
		if (status != -1) {
			criteria.andEqualTo("status", status);
		}
		if (id != -1) {
			criteria.andEqualTo("id", id);
		}

		List<Order> orders = orderMapper.selectByExample(example);

		for (Order order : orders) {

			orderVO = new OrderVO();

			BeanUtils.copyProperties(order, orderVO);

			Long oid = order.getId();

			Example exam = new Example(OrderDetail.class);
			exam.createCriteria().andEqualTo("oid", oid);
			List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(exam);
			orderVO.setOrderDetails(orderDetails);

			list.add(orderVO);

		}

		return EbookResult.ok(list);
	}

}
