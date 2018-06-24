package com.ebook.search.service;

import com.ebook.search.pojo.SearchResult;
import com.ebook.search.utils.EbookResult;

public interface SearchService {

	EbookResult importAllBooks();

	SearchResult search(String queryString, int page, int rows) throws Exception;
}
