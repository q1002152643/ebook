package com.ebook.portal.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class CartBook implements Serializable {

	private static final long serialVersionUID = 7401284991534297418L;

	private Long id;

	private String name;

	private Integer price;

	private Integer num;

	private String press;

	private String image;

}