package com.ebook.manager.service;

import org.springframework.web.multipart.MultipartFile;

import com.ebook.manager.utils.PictureResult;

public interface PictureService {
	public PictureResult uploadPicture(MultipartFile uploadFile);
}
