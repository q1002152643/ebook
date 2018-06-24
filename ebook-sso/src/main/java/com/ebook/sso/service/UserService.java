package com.ebook.sso.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.sso.pojo.User;
import com.ebook.sso.utils.EbookResult;

public interface UserService {

	public EbookResult createUser(User user);

	public EbookResult userLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response);

	public EbookResult findUserByToken(String token);

	public void userLogout(String token);

	public EbookResult checkData(String content, Integer type);
}
