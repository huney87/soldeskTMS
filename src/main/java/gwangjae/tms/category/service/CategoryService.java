package gwangjae.tms.category.service;

import gwangjae.tms.performance.domain.Performance;

import java.util.List;

public interface CategoryService {
	List<Performance> searchPerfomances(int genre);		//장르별 검색
}