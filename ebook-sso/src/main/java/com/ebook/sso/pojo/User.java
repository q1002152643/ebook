package com.ebook.sso.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "user")
public class User implements Serializable {

	private static final long serialVersionUID = -8805903096822826807L;

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Long id;

	private String username;

	private String password;

	private String phone;

	private Date created;

	private Date updated;

}
