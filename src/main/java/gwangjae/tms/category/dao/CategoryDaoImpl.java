package gwangjae.tms.category.dao;

import gwangjae.tms.category.dao.mapper.CategoryMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	@Autowired private CategoryMapper category;
	
	@Override
	public List<String> getSearchResult(int genre){
		return category.getSearchResult(genre);
	}
}
