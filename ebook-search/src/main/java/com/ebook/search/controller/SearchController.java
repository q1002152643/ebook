package com.ebook.search.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ebook.search.pojo.SearchResult;
import com.ebook.search.service.SearchService;
import com.ebook.search.utils.EbookResult;
import com.ebook.search.utils.ExceptionUtil;

@RestController
public class SearchController {

	@Autowired
	private SearchService searchService;

	/**
	 * 导入图书数据到索引库
	 */
	@RequestMapping("/importall")
	public EbookResult importAllBooks() {
		EbookResult result = searchService.importAllBooks();
		return result;
	}

	@GetMapping(value = "/query")
	public EbookResult search(@RequestParam("q") String queryString, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer rows) {
		// 查询条件不能为空
		if (StringUtils.isBlank(queryString)) {
			return EbookResult.build(400, "查询条件不能为空");
		}
		SearchResult searchResult = null;
		try {
			searchResult = searchService.search(queryString, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return EbookResult.ok(searchResult);

	}
}