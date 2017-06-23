package gwangjae.tms.category.dao;

import gwangjae.tms.category.domain.Category;

import java.util.List;

public interface CategoryDao {
	List<Category> getSearchResult(int genre);
}
