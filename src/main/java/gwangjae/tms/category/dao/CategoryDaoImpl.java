package gwangjae.tms.category.dao;

import gwangjae.tms.category.dao.mapper.CategoryMapper;
import gwangjae.tms.category.domain.Category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	@Autowired private CategoryMapper category;
	
	@Override
	public List<Category> getSearchResult(int genre){
		return category.getSearchResult(genre);
	}
}
