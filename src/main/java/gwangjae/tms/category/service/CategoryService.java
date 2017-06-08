package gwangjae.tms.category.service;

import gwangjae.tms.performance.domain.Performance;

import java.util.List;

public interface CategoryService {
	List<Performance> searchPerfomances(int genre);		//장르별 검색
	List<Performance> searchPerfRank();					//순위별 검색
	List<Performance> searchPerfDate();					//날짜별 검색
	List<Performance> searchPerfLocal(int localNum);		//지역별 검색
	List<Performance> searchTotalSearch(String search);	//통합검색
}