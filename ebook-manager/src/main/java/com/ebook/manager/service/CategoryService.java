package com.ebook.manager.service;

import com.ebook.manager.pojo.Category;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;

public interface CategoryService {

	EUDataGridResult getCategoryList(int page, int rows);

	EbookResult createCategory(Category category);

	EbookResult updateCategory(Category category);

	EbookResult deleteCategory(String ids);
}
