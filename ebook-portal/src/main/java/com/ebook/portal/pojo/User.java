package com.ebook.portal.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class User implements Serializable {

	private static final long serialVersionUID = -8805903096822826807L;

	private Long id;

	private String username;

	private String password;

	private String phone;

	private Date created;

	private Date updated;

}
