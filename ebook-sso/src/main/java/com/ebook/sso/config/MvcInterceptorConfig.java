package com.ebook.sso.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MvcInterceptorConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private DomainBaseUrlInterceptor domainBaseUrlInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(domainBaseUrlInterceptor).addPathPatterns("/**");

	}
}
