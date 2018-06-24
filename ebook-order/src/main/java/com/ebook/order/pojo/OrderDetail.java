package com.ebook.order.pojo;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "order_detail")
public class OrderDetail implements Serializable {

	private static final long serialVersionUID = -4267392010468204098L;

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id;

	private Long bid;

	private Long oid;

	private String name;

	private Integer price;

	private Integer num;

	private String press;

	private String image;

}