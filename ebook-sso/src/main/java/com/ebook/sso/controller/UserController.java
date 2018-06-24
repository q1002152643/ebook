package com.ebook.sso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ebook.sso.pojo.User;
import com.ebook.sso.service.UserService;
import com.ebook.sso.utils.EbookResult;
import com.ebook.sso.utils.ExceptionUtil;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	// 创建用户
	@PostMapping("/register")
	public EbookResult createUser(User user) {

		try {
			EbookResult result = userService.createUser(user);
			return result;
		} catch (Exception e) {
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}

	// 用户登录
	@PostMapping("/login")
	public EbookResult userLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		try {

			EbookResult result = userService.userLogin(username, password, request, response);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}

	@GetMapping("/token/{token}")
	public EbookResult findUserByToken(@PathVariable String token) {
		EbookResult result = null;
		try {
			result = userService.findUserByToken(token);
			return EbookResult.ok(result);
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}

	}

	@GetMapping("/check/{param}/{type}")
	public Object checkData(@PathVariable String param, @PathVariable Integer type) {

		EbookResult result = null;

		// 参数有效性校验
		if (StringUtils.isBlank(param)) {
			result = EbookResult.build(400, "校验内容不能为空");
		}
		if (type == null) {
			result = EbookResult.build(400, "校验内容类型不能为空");
		}
		if (type != 1 && type != 2) {
			result = EbookResult.build(400, "校验内容类型错误");
		}
		// 校验出错
		if (null != result) {
			return result;
		}

		try {
			result = userService.checkData(param, type);

		} catch (Exception e) {
			result = EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}

		return result;

	}

}
