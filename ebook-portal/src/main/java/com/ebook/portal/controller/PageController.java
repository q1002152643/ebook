package com.ebook.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ebook.portal.service.BookService;

@Controller
public class PageController {

	@Autowired
	private BookService bookService;

	@GetMapping(value = "/")
	public String showIndex(Model m) {

		List category = bookService.getList();
		m.addAttribute("category", category);
		return "home/home";

	}

	@GetMapping(value = "/{page}")
	public String showIndex(@PathVariable String page) {
		return "home/" + page;

	}

}
