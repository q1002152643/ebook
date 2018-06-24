package com.ebook.portal.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Book implements Serializable {

	private static final long serialVersionUID = -990323253240066699L;

	private Long id;

	private String name;

	private String author;

	private Integer price;

	private String press;

	private String publishTime;

	private Integer edition;

	private Long cid;

	private String image;

	private String cname;

	private String description;

}