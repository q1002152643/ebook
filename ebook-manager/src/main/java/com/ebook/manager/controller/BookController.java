package com.ebook.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ebook.manager.pojo.Book;
import com.ebook.manager.service.BookService;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;

@RestController
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private StringRedisTemplate redisTemplate;

	private final String BOOK_SYNC_KEY = "BOOK_SYNC_KEY";

	@GetMapping("/{id}")
	public Book findBookById(@PathVariable("id") long id) {
		return bookService.findBookById(id);
	}

	@GetMapping("/list")
	public EUDataGridResult getBookList(Integer page, Integer rows) {
		EUDataGridResult result = bookService.getBookList(page, rows);
		return result;
	}

	@PostMapping
	public EbookResult createBook(Book book) {
		EbookResult result = bookService.createBook(book);
		sync();
		return result;
	}

	@PutMapping
	public EbookResult updateBook(Book book) {
		EbookResult result = bookService.updateBook(book);
		sync();
		return result;
	}

	@DeleteMapping
	public EbookResult deleteBook(String ids) {
		EbookResult result = bookService.deleteBook(ids);
		sync();
		return result;
	}

	private void sync() {
		try {
			redisTemplate.opsForValue().set(BOOK_SYNC_KEY, BOOK_SYNC_KEY);
		} catch (Exception e) {
			redisTemplate.opsForValue().set(BOOK_SYNC_KEY, BOOK_SYNC_KEY);
		}
	}
}
