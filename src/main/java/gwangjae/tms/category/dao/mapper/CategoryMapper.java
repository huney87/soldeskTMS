package gwangjae.tms.category.dao.mapper;

import gwangjae.tms.category.domain.Category;

import java.util.List;

public interface CategoryMapper {
	List<Category> getSearchResult(int genre);	//종합 카테고리
}
