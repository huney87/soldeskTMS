package gwangjae.tms.category.dao.mapper;

import gwangjae.tms.performance.domain.Performance;

import java.util.List;

public interface CategoryMapper {
	List<Performance> getSearchResult(int genre);	//종합 카테고리
}
