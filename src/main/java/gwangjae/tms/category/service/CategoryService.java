package gwangjae.tms.category.service;

import gwangjae.tms.category.domain.Category;

import java.util.List;

public interface CategoryService {
	List<Category> getSearchResult(int genre);		//장르별 검색
}