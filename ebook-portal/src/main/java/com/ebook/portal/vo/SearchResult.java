package com.ebook.portal.vo;

import java.util.List;

import lombok.Data;

@Data
public class SearchResult {

	// 商品列表
	private List<Book> bookList;
	// 总记录数
	private long recordCount;
	// 总页数
	private long pageCount;
	// 当前页
	private long curPage;

}
