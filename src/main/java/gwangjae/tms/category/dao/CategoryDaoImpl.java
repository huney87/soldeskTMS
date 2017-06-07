package gwangjae.tms.category.dao;

import gwangjae.tms.category.dao.mapper.CategoryMapper;
import gwangjae.tms.performance.domain.Performance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	@Autowired private CategoryMapper category;
	
	@Override
	public List<Performance> getSearchResult(){
		return category.getSearchResult();
	}
}
