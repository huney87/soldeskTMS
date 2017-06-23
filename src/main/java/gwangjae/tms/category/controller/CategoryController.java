package gwangjae.tms.category.controller;

import gwangjae.tms.category.domain.Category;
import gwangjae.tms.category.service.CategoryService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController<Genre> {
	@Autowired private CategoryService service;
	
	@RequestMapping
	public String main(){
		return "/category/category";
	}
	
	@RequestMapping("/category")	//장르별 검색(버튼)
	@ResponseBody
	public List<Category> getSearchResult(@RequestParam(value="Performance[]") List<String> categories,
					@RequestParam(value="Category") int genre, @RequestParam(value="Hall") String hallName){
		return	service.getSearchResult(genre);
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String category2View(Model model, HttpSession session,@RequestParam("genid") int genre){
		/*널이 아니며 빈 문자열이 아니면 로그인 되어있는것*/  
		if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")){
			model.addAttribute("login", true);
		}else{
			model.addAttribute("login", false);
		}
		List<Category> genreList = service.getSearchResult(genre);
        model.addAttribute("genreList", genreList);
		return "/category/category2";
	}
}