package com.ebook.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.service.UserService;
import com.ebook.portal.utils.EbookResult;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/token/{token}", method = RequestMethod.GET)
	@ResponseBody
	public Object findUserByToken(@PathVariable("token") String token) {
		EbookResult result = userService.findUserByToken(token);
		Object data = result.getData();
		return data;

	}

}
