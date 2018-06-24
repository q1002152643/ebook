package com.ebook.portal.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.pojo.Book;
import com.ebook.portal.pojo.CartBook;
import com.ebook.portal.pojo.User;
import com.ebook.portal.service.BookService;
import com.ebook.portal.utils.JsonUtils;

@Controller
@RequestMapping("/cart")
public class CartController {

	public static final String REDIS_CART_KEY = "REDIS_CART_KEY";

	@Autowired
	private StringRedisTemplate redisTemplate;

	@Autowired
	private BookService bookService;

	private Integer getTotal(List<CartBook> list) {
		Integer sum = 0;
		for (CartBook cartBook : list) {
			sum += cartBook.getPrice() * cartBook.getNum();
		}
		return sum;

	}

	@GetMapping(value = "/update/{id}/{num}")
	@ResponseBody
	public Integer updateCart(@PathVariable Long id, @PathVariable Integer num, HttpServletRequest request) {
		User user = (User) request.getAttribute("user");
		String key = REDIS_CART_KEY + ":" + user.getId();
		List<CartBook> list = null;
		Integer sum = null;
		try {
			String json = redisTemplate.opsForValue().get(key);
			// 判断是否为空

			list = JsonUtils.jsonToList(json, CartBook.class);

			int i = -1;
			for (CartBook cartBook : list) {
				i++;
				if (cartBook.getId().equals(id)) {
					break;
				}
			}
			list.get(i).setNum(num);

			sum = this.getTotal(list);

			json = JsonUtils.objectToJson(list);
			// 更新过期时间
			redisTemplate.opsForValue().set(key, json, 15, TimeUnit.MINUTES);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sum;

	}

	@GetMapping(value = "/showCart")
	public String showCart(HttpServletRequest request, Model model) {
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
			model.addAttribute("lists", list);
			model.addAttribute("total", this.getTotal(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home/cart";
	}

	@GetMapping(value = "/add/{id}")
	public String addCart(@PathVariable Long id, HttpServletRequest request) {
		Book book = bookService.findBookById(id);
		CartBook cartBook = new CartBook();
		BeanUtils.copyProperties(book, cartBook);
		cartBook.setNum(1);

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

			if (list.size() > 0) {
				boolean flag = false;
				for (CartBook cartBook2 : list) {
					if (cartBook2.getId().equals(id)) {
						cartBook2.setNum(cartBook2.getNum() + 1);
						flag = true;
						break;
					}
				}
				if (!flag) {
					list.add(cartBook);
				}
			} else {
				list.add(cartBook);
			}
			json = JsonUtils.objectToJson(list);
			// 更新过期时间
			redisTemplate.opsForValue().set(key, json, 15, TimeUnit.MINUTES);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/cart/showCart";

	}

	@GetMapping(value = "/delete/{id}")
	public String deleteCart(@PathVariable Long id, HttpServletRequest request) {

		User user = (User) request.getAttribute("user");
		String key = REDIS_CART_KEY + ":" + user.getId();
		List<CartBook> list = null;

		try {
			String json = redisTemplate.opsForValue().get(key);
			// 判断是否为空

			list = JsonUtils.jsonToList(json, CartBook.class);

			int i = -1;
			for (CartBook cartBook : list) {
				i++;
				if (cartBook.getId().equals(id)) {
					break;
				}
			}
			list.remove(i);

			json = JsonUtils.objectToJson(list);
			// 更新过期时间
			redisTemplate.opsForValue().set(key, json, 15, TimeUnit.MINUTES);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/cart/showCart";

	}
}
