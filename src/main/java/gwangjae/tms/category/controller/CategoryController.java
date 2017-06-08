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
	
	@RequestMapping("/category")
	@ResponseBody
	public String searchPerformances(HttpServletRequest request){
		int genre = Integer.parseInt(request.getParameter("button"));	//버튼 값 1.뮤지컬, 2.콘서트, 3.공연
		service.searchPerfomances(genre);
		return "/category";
	}
	
	@RequestMapping("/Local")
	@ResponseBody
	public String searchPerfLocal(HttpServletRequest request){
		int localNum = Integer.parseInt(request.getParameter("local"));
		service.searchPerfLocal(localNum);
		return "/category";
	}
	
	@RequestMapping("/totalSearch")
	@ResponseBody
	public String searchTotalSearch(HttpServletRequest request){
		String searchResult = request.getParameter("search");
		service.searchTotalSearch(searchResult);
		return "/category";
	}
}