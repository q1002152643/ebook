package com.ebook.manager.service;

import com.ebook.manager.pojo.Book;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;

public interface BookService {

	EUDataGridResult getBookList(int page, int rows);

	EbookResult createBook(Book book);

	EbookResult updateBook(Book book);

	EbookResult deleteBook(String ids);

	Book findBookById(long id);
}
