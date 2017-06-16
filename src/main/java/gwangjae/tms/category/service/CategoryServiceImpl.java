package gwangjae.tms.category.service;

import gwangjae.tms.category.dao.CategoryDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired private CategoryDao dao;
	
	@Override
	public List<String> getSearchResult(int genre){
		return dao.getSearchResult(genre);
	}
}