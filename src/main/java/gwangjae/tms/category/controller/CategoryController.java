package gwangjae.tms.category.controller;

import gwangjae.tms.category.service.CategoryService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired private CategoryService service;
	
	@RequestMapping("/category")	//장르별 검색(버튼)
	@ResponseBody
	public String searchPerformances(int genre){
		service.searchPerfomances(genre);
		return "/category";
	}
	
	@RequestMapping("/Local")	//지역별검색
	@ResponseBody
	public String searchPerfLocal(int localNum){
		service.searchPerfLocal(localNum);
		return "/category";
	}
	
	@RequestMapping("/totalSearch")	//통합 검색
	@ResponseBody
	public String searchTotalSearch(String searchResult){
		service.searchTotalSearch(searchResult);
		return "/category";
	}
}