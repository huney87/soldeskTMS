package gwangjae.tms.category.controller;

import gwangjae.tms.category.service.CategoryService;
import gwangjae.tms.performance.domain.Performance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired private CategoryService service;
	
	@RequestMapping
	@ResponseBody
	public List<Performance> searchPerformances(){
		return service.searchPerfomances();
	}
}
