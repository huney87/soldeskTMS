package gwangjae.tms.common.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@RequestMapping("test")
	public String testView(){
		return "/test";
	}

	@RequestMapping
	public String mainView(Model model, HttpSession session){
		/*널이 아니며 빈 문자열이 아니면 로그인 되어있는것*/  
		if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")){
			model.addAttribute("login", true);
		}else{
			model.addAttribute("login", false);
		}
		return "/main";
	}
	
	@RequestMapping("category2")
	public String category2View(){
		return "/category/category2";
	}
	
	@RequestMapping("detail")
	public String detailView(){
		return "/detail/detail";
	}
}
