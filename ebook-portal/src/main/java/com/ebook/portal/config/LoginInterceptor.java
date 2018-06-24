package com.ebook.portal.config;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ebook.portal.pojo.User;
import com.ebook.portal.service.UserService;
import com.ebook.portal.utils.CookieUtils;
import com.ebook.portal.utils.EbookResult;
import com.ebook.portal.utils.JsonUtils;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private UserService userService;

	@Value("${SSO_BASE_URL}")
	private String SSO_BASE_URL;
	@Value("${SSO_PAGE_LOGIN}")
	private String SSO_PAGE_LOGIN;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 在Handler执行之前处理
		String queryString = request.getQueryString();
		if (queryString != null) {
			queryString = "?" + queryString;
		} else {
			queryString = "";
		}
		// 判断用户是否登录
		// 从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TOKEN");
		if (null == token) {
			// 跳转到登录页面，把用户请求的url作为参数传递给登录页面。
			response.sendRedirect(SSO_BASE_URL + SSO_PAGE_LOGIN + "?redirect=" + request.getRequestURL() + queryString);
			// 返回false
			return false;
		}

		// 根据token换取用户信息，调用sso系统的接口。
		EbookResult result = userService.findUserByToken(token);
		if (result.getStatus() != 200) {
			// 跳转到登录页面，把用户请求的url作为参数传递给登录页面。
			response.sendRedirect(SSO_BASE_URL + SSO_PAGE_LOGIN + "?redirect=" + request.getRequestURL() + queryString);
			// 返回false
			return false;
		}
		LinkedHashMap data = (LinkedHashMap) result.getData();
		String json = JsonUtils.objectToJson(data.get("data"));
		User user = JsonUtils.jsonToPojo(json, User.class);
		// 取不到用户信息

		if (null == user) {
			// 跳转到登录页面，把用户请求的url作为参数传递给登录页面。
			response.sendRedirect(SSO_BASE_URL + SSO_PAGE_LOGIN + "?redirect=" + request.getRequestURL() + queryString);
			// 返回false
			return false;
		}
		// 取到用户信息，放行
		request.setAttribute("user", user);
		// 返回值决定handler是否执行。true：执行，false：不执行。
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// handler执行之后，返回ModelAndView之前

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 返回ModelAndView之后。
		// 响应用户之后。

	}

}
