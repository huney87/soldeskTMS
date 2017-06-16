package gwangjae.tms.category.controller;

import gwangjae.tms.category.service.CategoryService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired private CategoryService service;
	
	@RequestMapping
	public String main(){
		return "/category/category";
	}
	
	@RequestMapping("/category")	//장르별 검색(버튼)
	@ResponseBody
	public List<String> getSearchResult(@RequestParam(value="Performance[]") List<String> categories,
					@RequestParam(value="Category") int genre, @RequestParam(value="Hall") String hallName){
		return	service.getSearchResult(genre);
	}
}