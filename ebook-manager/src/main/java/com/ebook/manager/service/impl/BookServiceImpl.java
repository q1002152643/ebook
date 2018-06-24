package com.ebook.manager.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebook.manager.mapper.BookMapper;
import com.ebook.manager.pojo.Book;
import com.ebook.manager.service.BookService;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;
import com.ebook.manager.utils.JsonUtils;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;

	@Autowired
	private StringRedisTemplate redisTemplate;

	private final String BOOK_KEY = "BOOK_KEY:";

	@Override
	public EUDataGridResult getBookList(int page, int rows) {
		Example example = new Example(Book.class);
		// 分页处理
		PageHelper.startPage(page, rows);
		List<Book> list = bookMapper.selectByExample(example);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		PageInfo<Book> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EbookResult createBook(Book book) {

		bookMapper.insert(book);

		return EbookResult.ok();
	}

	@Override
	public EbookResult updateBook(Book book) {
		bookMapper.updateByPrimaryKey(book);
		String key = BOOK_KEY + book.getId();

		try {
			redisTemplate.delete(key);
		} catch (Exception e) {
		}

		return EbookResult.ok();
	}

	@Override
	public EbookResult deleteBook(String ids) {
		String[] id = ids.split(",");
		for (String string : id) {
			long itemId = Long.parseLong(string);
			bookMapper.deleteByPrimaryKey(itemId);
		}
		return EbookResult.ok();
	}

	@Override
	public Book findBookById(long id) {

		String key = BOOK_KEY + id;
		ValueOperations<String, String> operations = redisTemplate.opsForValue();

		try {
			String str = operations.get(key);
			if (StringUtils.isNotBlank(str)) {
				Book book = JsonUtils.jsonToPojo(str, Book.class);
				return book;
			}
		} catch (Exception e) {
		}

		Book book = bookMapper.selectByPrimaryKey(id);

		if (book != null) {

			try {
				operations.set(key, JsonUtils.objectToJson(book));
			} catch (Exception e) {
			}
			return book;
		}
		return null;

	}
}
