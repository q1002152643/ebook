package com.ebook.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ebook.manager.pojo.Category;
import com.ebook.manager.service.CategoryService;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;

@RestController
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/list")
	public EUDataGridResult getCategoryList(Integer page, Integer rows) {
		EUDataGridResult result = categoryService.getCategoryList(page, rows);
		return result;
	}

	@PostMapping("/list")
	@SuppressWarnings("all")
	public List getList() {
		List catList = new ArrayList();
		EUDataGridResult result = categoryService.getCategoryList(-1, -1);
		List<Category> list = (List<Category>) result.getRows();
		for (Category category : list) {
			Map node = new HashMap<>();
			node.put("id", category.getId());
			node.put("text", category.getName());
			node.put("state", "open");
			catList.add(node);
		}

		return catList;
	}

	@PostMapping
	public EbookResult createCategory(Category category) {
		EbookResult result = categoryService.createCategory(category);
		return result;
	}

	@PutMapping
	public EbookResult updateCategory(Category category) {
		EbookResult result = categoryService.updateCategory(category);
		return result;
	}

	@DeleteMapping
	public EbookResult deleteCategory(String ids) {
		EbookResult result = categoryService.deleteCategory(ids);
		return result;
	}
}
