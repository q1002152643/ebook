package com.ebook.portal.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Book implements Serializable {

	private static final long serialVersionUID = 1195579640992423145L;

	private Long id;

	private String name;

	private String author;

	private Integer price;

	private Integer num;

	private String press;

	private String publishTime;

	private Integer edition;

	private Integer pageNum;

	private Integer wordNum;

	private Long cid;

	private String image;

}