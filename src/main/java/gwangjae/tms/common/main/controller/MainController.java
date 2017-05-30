package gwangjae.tms.common.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
	
	@RequestMapping("test")
	public String testView(){
		return "/test";
	}
	
	@RequestMapping
	public String mainView(){
		return "/main";
	}
}
