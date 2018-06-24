package com.ebook.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ebook.manager.mapper.CategoryMapper;
import com.ebook.manager.pojo.Category;
import com.ebook.manager.service.CategoryService;
import com.ebook.manager.utils.EUDataGridResult;
import com.ebook.manager.utils.EbookResult;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public EUDataGridResult getCategoryList(int page, int rows) {
		Example example = new Example(Category.class);
		// 分页处理
		if (page != -1 && rows != -1) {
			PageHelper.startPage(page, rows);
		}

		List<Category> list = categoryMapper.selectByExample(example);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);

		if (page == -1 && rows == -1) {
			return result;
		}
		// 取记录总条数
		PageInfo<Category> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EbookResult createCategory(Category category) {
		categoryMapper.insert(category);
		return EbookResult.ok();
	}

	@Override
	public EbookResult updateCategory(Category category) {
		categoryMapper.updateByPrimaryKey(category);
		return EbookResult.ok();
	}

	@Override
	public EbookResult deleteCategory(String ids) {
		String[] id = ids.split(",");
		for (String string : id) {
			long itemId = Long.parseLong(string);
			categoryMapper.deleteByPrimaryKey(itemId);
		}
		return EbookResult.ok();
	}
}
