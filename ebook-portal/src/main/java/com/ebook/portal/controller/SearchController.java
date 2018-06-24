package com.ebook.portal.controller;

import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ebook.portal.service.SearchService;
import com.ebook.portal.utils.EbookResult;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	@RequestMapping(value = "/query")
	public String search(Model model,
			@RequestParam(value = "q", defaultValue = "*", required = false) String queryString,
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
		EbookResult result = searchService.search(queryString.trim(), page, rows);

		LinkedHashMap data = (LinkedHashMap) result.getData();
		Object bookList = data.get("bookList");
		Object recordCount = data.get("recordCount");
		Object pageCount = data.get("pageCount");
		Object curPage = data.get("curPage");

		model.addAttribute("bookList", bookList);
		model.addAttribute("recordCount", recordCount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("curPage", curPage);
		model.addAttribute("queryString", queryString);
		return "home/search";

	}

}
