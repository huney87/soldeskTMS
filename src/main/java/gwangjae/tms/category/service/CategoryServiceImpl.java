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
	public List<Performance> searchPerfomances(int genre){
		Category cate = new Category();
		cate.setGen_id(genre);
		return dao.getSearchResult();
	}
	
	public List<Performance> searchPerfRank(){
		return null;
	}
	public List<Performance> searchPerfDate(){
		return null;
	}
	public List<Performance> searchPerfLocal(int localNum){
		Category cate = new Category();
		cate.setLoc_id(localNum);
		return dao.getSearchResult();
	}
	
	public List<Performance> searchTotalSearch(String search){
		Performance perf = new Performance();
		Hall hall = new Hall();
		Center cen = new Center();
		perf.setPer_title(search);
		hall.setHallName(search);
		cen.setCenterName(search);
		if((perf.getPer_title() != null && !perf.getPer_title().equals(""))
				&& (hall.getHallName() != null && !hall.getHallName().equals(""))
				&& (cen.getCenterName() != null && !cen.getCenterName().equals(""))){
			dao.getSearchResult();
		}
		return dao.getSearchResult();
	}
}