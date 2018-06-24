package com.ebook.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ebook.search.pojo.Book;

public interface BookMapper {

	@Select("SELECT b.`id` id,b.`name` `name`,author,price,press,publish_time publishTime,edition,cid,image,c.`name` cname,description FROM book b LEFT JOIN `category` c ON b.cid = c.id ")
	List<Book> getBookList();

}
