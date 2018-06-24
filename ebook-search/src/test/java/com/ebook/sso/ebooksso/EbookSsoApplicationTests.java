package com.ebook.sso.ebooksso;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.ebook.search.mapper.BookMapper;
import com.ebook.search.pojo.Book;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EbookSsoApplicationTests {

	@Autowired
	private BookMapper bookMapper;

	@Test
	public void contextLoads() {
		List<Book> bookList = bookMapper.getBookList();

		Book book = bookList.get(0);
	}

}
