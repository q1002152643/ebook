package com.ebook.portal.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.utils.EbookResult;

@FeignClient(name = "ebook-search")
public interface SearchService {

	@RequestMapping(value = "/query", method = RequestMethod.GET)
	@ResponseBody
	EbookResult search(@RequestParam("q") String queryString, @RequestParam(value="page",defaultValue = "1") Integer page,
			@RequestParam(value="rows",defaultValue = "10") Integer rows);
}