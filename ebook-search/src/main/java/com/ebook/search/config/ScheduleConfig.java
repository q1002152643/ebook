package com.ebook.search.config;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.ebook.search.service.SearchService;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableScheduling
@Slf4j
public class ScheduleConfig {

	@Autowired
	private SearchService searchService;

	@Autowired
	private StringRedisTemplate redisTemplate;

	private final String BOOK_SYNC_KEY = "BOOK_SYNC_KEY";

	@Scheduled(cron = "0 0/1 * * * ?")
	private void configureTasks() {
		ValueOperations<String, String> operations = redisTemplate.opsForValue();
		String str = operations.get(BOOK_SYNC_KEY);
		if (StringUtils.isNotBlank(str)) {
			searchService.importAllBooks();
			log.info("【索引库同步成功！】");
			redisTemplate.delete(BOOK_SYNC_KEY);
		}
	}
}