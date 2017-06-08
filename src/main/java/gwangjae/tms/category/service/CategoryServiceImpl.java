package gwangjae.tms.category.service;

import gwangjae.tms.category.dao.CategoryDao;
import gwangjae.tms.category.domain.Category;
import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.performance.domain.Performance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired private CategoryDao dao;
	
	@Override
	public List<Performance> searchPerfomances(){
		Category cate = new Category();
		Performance per = new Performance();
		Hall hall = new Hall();
		Center cen = new Center();
		if(cate.getGen_id() != 0){
			dao.getSearchResult();
		}
		return dao.getSearchResult();
	}
}