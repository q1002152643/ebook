package com.ebook.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/")
	public String showIndex() {
		return "login";
	}

	@RequestMapping("/{page}")
	public String showPage(String page) {
		return page;
	}

}
