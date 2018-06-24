package com.ebook.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ebook.portal.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;

	@GetMapping(value = "/{id}")
	public String findBookById(@PathVariable("id") long id, Model model) {

		model.addAttribute("book", bookService.findBookById(id));
		return "home/description";

	}

}
