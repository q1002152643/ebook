package com.ebook.portal.pojo;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrderDetail implements Serializable {

	private static final long serialVersionUID = -4267392010468204098L;

	private Long id;

	private Long bid;

	private Long oid;

	private String name;

	private Integer price;

	private Integer num;

	private String press;

	private String image;

}