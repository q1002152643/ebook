package com.ebook.order.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "t_order")
@Data
public class Order implements Serializable {

	private static final long serialVersionUID = -2359347390468660754L;

	@Id
	private Long id;

	private Integer payment;

	private Integer status;

	private Date createTime;

	private Date updateTime;

	private Long uid;

}
