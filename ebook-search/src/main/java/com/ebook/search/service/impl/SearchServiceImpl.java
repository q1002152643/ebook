package com.ebook.search.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.search.mapper.BookMapper;
import com.ebook.search.pojo.Book;
import com.ebook.search.pojo.SearchResult;
import com.ebook.search.service.SearchService;
import com.ebook.search.utils.EbookResult;
import com.ebook.search.utils.ExceptionUtil;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SolrClient solrClient;

	@Autowired
	private BookMapper bookMapper;

	@Override
	public SearchResult search(String queryString, int page, int rows) throws Exception {
		// 创建查询对象
		SolrQuery query = new SolrQuery();
		// 设置查询条件
		query.setQuery(queryString);
		// 设置分页
		query.setStart((page - 1) * rows);
		query.setRows(rows);
		// 设置默认搜素域
		query.set("df", "book_keywords");
		// 设置高亮显示
		query.setHighlight(true);
		query.addHighlightField("book_name");
		query.setHighlightSimplePre("<em style=\"color:red\">");
		query.setHighlightSimplePost("</em>");
		// 执行查询
		// 返回值对象
		SearchResult result = new SearchResult();
		// 根据查询条件查询索引库
		QueryResponse queryResponse = solrClient.query(query);
		// 取查询结果
		SolrDocumentList solrDocumentList = queryResponse.getResults();
		// 取查询结果总数量
		result.setRecordCount(solrDocumentList.getNumFound());
		// 图书列表
		List<Book> bookList = new ArrayList<>();
		// 取高亮显示
		Map<String, Map<String, List<String>>> highlighting = queryResponse.getHighlighting();
		// 取图书列表
		for (SolrDocument solrDocument : solrDocumentList) {
			// 创建一图书对象
			Book book = new Book();
			book.setId(Long.parseLong(solrDocument.get("id").toString()));
			// 取高亮显示的结果
			List<String> list = highlighting.get(solrDocument.get("id")).get("book_name");
			String name = "";
			if (list != null && list.size() > 0) {
				name = list.get(0);
			} else {
				name = (String) solrDocument.get("book_name");
			}
			book.setName(name);

			book.setAuthor((String) solrDocument.get("book_author"));
			book.setPrice((Integer) solrDocument.get("book_price"));
			book.setPress((String) solrDocument.get("book_press"));
			book.setPublishTime((String) solrDocument.get("book_publishTime"));
			book.setImage((String) solrDocument.get("book_image"));
			// 添加的图书列表
			bookList.add(book);

		}
		result.setBookList(bookList);
		// 计算查询结果总页数
		long recordCount = result.getRecordCount();
		long pageCount = recordCount / rows;
		if (recordCount % rows > 0) {
			pageCount++;
		}
		result.setPageCount(pageCount);
		result.setCurPage(page);

		return result;
	}

	@Override
	public EbookResult importAllBooks() {
		try {

			solrClient.deleteByQuery("*:*");
			// 查询图书列表
			List<Book> list = bookMapper.getBookList();
			// 把图书信息写入索引库
			for (Book book : list) {
				// 创建一个SolrInputDocument对象
				SolrInputDocument document = new SolrInputDocument();
				document.setField("id", book.getId());
				document.setField("book_name", book.getName());
				document.setField("book_author", book.getAuthor());
				document.setField("book_price", book.getPrice());
				document.setField("book_press", book.getPress());
				document.setField("book_publishTime", book.getPublishTime());
				document.setField("book_edition", book.getEdition());
				document.setField("book_cid", book.getCid());
				document.setField("book_image", book.getImage());
				document.setField("book_cname", book.getCname());
				document.setField("book_description", book.getDescription());

				// 写入索引库
				solrClient.add(document);
			}
			// 提交修改
			solrClient.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return EbookResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return EbookResult.ok();
	}

}
