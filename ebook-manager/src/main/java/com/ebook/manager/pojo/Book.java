package com.ebook.manager.pojo;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "book")
public class Book implements Serializable {

	private static final long serialVersionUID = 1195579640992423145L;

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
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