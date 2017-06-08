package gwangjae.tms.category.controller;

import javax.servlet.http.HttpServletRequest;

import gwangjae.tms.category.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired private CategoryService service;
	
	@RequestMapping
	@ResponseBody
	public String searchPerformances(HttpServletRequest request){
		int genre = Integer.parseInt(request.getParameter("button"));	//버튼 값 1.뮤지컬, 2.콘서트, 3.공연
		service.searchPerfomances(genre);
		return "/category";
	}
}