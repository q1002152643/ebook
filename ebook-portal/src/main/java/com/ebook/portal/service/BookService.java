package com.ebook.portal.service;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.pojo.Book;

@FeignClient(name = "ebook-manager")
public interface BookService {

	@RequestMapping(value="/book/{id}",method=RequestMethod.GET)
	@ResponseBody
	Book findBookById(@PathVariable("id") long id);

	@RequestMapping(value="/category/list",method=RequestMethod.POST)
	@ResponseBody
	List getList();

}