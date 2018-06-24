package com.ebook.portal.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebook.portal.utils.EbookResult;

@FeignClient(name = "ebook-sso")
public interface UserService {

	@RequestMapping(value="/user/token/{token}",method=RequestMethod.GET)
	@ResponseBody
	EbookResult findUserByToken(@PathVariable("token") String token);
}