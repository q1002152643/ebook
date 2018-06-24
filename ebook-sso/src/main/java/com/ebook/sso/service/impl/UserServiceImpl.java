package com.ebook.sso.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ebook.sso.mapper.UserMapper;
import com.ebook.sso.pojo.User;
import com.ebook.sso.service.UserService;
import com.ebook.sso.utils.CookieUtils;
import com.ebook.sso.utils.EbookResult;
import com.ebook.sso.utils.JsonUtils;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	public static final String REDIS_USER_SESSION_KEY = "REDIS_USER_SESSION_KEY";

	public static final long SSO_SESSION_EXPIRE = 30;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private StringRedisTemplate redisTemplate;

	@Override
	public EbookResult createUser(User user) {
		user.setCreated(new Date());
		userMapper.insertSelective(user);
		return EbookResult.ok();
	}

	@Override
	public EbookResult userLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("username", username).andEqualTo("password", password);
		List<User> list = userMapper.selectByExample(example);

		if (null == list || list.size() == 0) {
			return EbookResult.build(400, "用户名或密码错误");
		}
		User user = list.get(0);
		String token = UUID.randomUUID().toString();
		user.setPassword(null);

		// 把用户信息写入redis
		redisTemplate.opsForValue().set(REDIS_USER_SESSION_KEY + ":" + token, JsonUtils.objectToJson(user),
				SSO_SESSION_EXPIRE, TimeUnit.MINUTES);

		CookieUtils.setCookie(request, response, "TOKEN", token);
		// 返回token
		return EbookResult.ok(token);
	}

	@Override
	public EbookResult findUserByToken(String token) {
		// 根据token从redis中查询用户信息
		String json = redisTemplate.opsForValue().get(REDIS_USER_SESSION_KEY + ":" + token);
		// 判断是否为空
		if (StringUtils.isEmpty(json)) {
			return EbookResult.build(400, "此session已经过期，请重新登录");
		}
		// 更新过期时间
		redisTemplate.opsForValue().set(REDIS_USER_SESSION_KEY + ":" + token, json, SSO_SESSION_EXPIRE,
				TimeUnit.MINUTES);

		// 返回用户信息
		return EbookResult.ok(JsonUtils.jsonToPojo(json, User.class));
	}

	@Override
	public void userLogout(String token) {
		redisTemplate.delete(REDIS_USER_SESSION_KEY + ":" + token);
	}

	@Override
	public EbookResult checkData(String content, Integer type) {
		// 创建查询条件
		Example example = new Example(User.class);
		Criteria criteria = example.createCriteria();
		// 对数据进行校验：1、2分别代表username、phone
		// 用户名校验
		if (1 == type) {
			criteria.andEqualTo("username", content);
			// 电话校验
		} else if (2 == type) {
			criteria.andEqualTo("phone", content);
		}
		// 执行查询
		List<User> list = userMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return EbookResult.ok(true);
		}
		return EbookResult.ok(false);
	}

}
