package com.recruit.service.impl;

import com.recruit.dto.category.CreateOrUpdateCategoryDTO;
import com.recruit.model.CategoryDO;
import com.recruit.mapper.CategoryMapper;
import com.recruit.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Eval
 * @since 2022-04-04
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, CategoryDO> implements CategoryService {

    @Resource
    private CategoryMapper categoryMapper;

    @Override
    public boolean createCategory(CreateOrUpdateCategoryDTO validator) {
        CategoryDO  categoryDO = new CategoryDO();
        categoryDO.setName(validator.getName());
        categoryDO.setDescription(validator.getDescription());
        return categoryMapper.insert(categoryDO) > 0;
    }

    @Override
    public boolean updateCategory(CategoryDO categoryDO, CreateOrUpdateCategoryDTO validator) {
        categoryDO.setName(validator.getName());
        categoryDO.setDescription(validator.getDescription());
        return categoryMapper.updateById(categoryDO) > 0;
    }

    @Override
    public boolean deleteById(Integer id) {
        return categoryMapper.deleteById(id) > 0;
    }

    @Override
    public List<CategoryDO> getAll() {
        return categoryMapper.selectList(null);
    }

    @Override
    public List<CategoryDO> show() {
        return categoryMapper.show();
    }
}
