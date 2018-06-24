package com.ebook.portal.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Order implements Serializable {

	private static final long serialVersionUID = -2359347390468660754L;

	private Long id;

	private Integer payment;

	private Integer status;

	private Date createTime;

	private Date updateTime;

	private Long uid;

}
