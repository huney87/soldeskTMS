package gwangjae.tms.common.main.controller;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.ticketing.service.TicketingService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired TicketingService service;
	
	@RequestMapping("test")
	public String testView(){
		return "/test";
	}

	@RequestMapping
	public String mainView(Model model, HttpSession session){
		/*널이 아니며 빈 문자열이 아니면 로그인 되어있는것*/  
		if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")){
			Object email = session.getAttribute("email");
			model.addAttribute("login", true);
			model.addAttribute("email", email);
		}else{
			model.addAttribute("login", false);
		}
		if(session.getAttribute("user_type") != null && !session.getAttribute("user_type").equals("")){
			Object user_type = session.getAttribute("user_type");
			model.addAttribute("user_type", user_type);
		}
		return "/main";
	}

	/*@RequestMapping(value="",method=RequestMethod.GET)
    public String moveToCrudMainPage(Model model) {
        List<> crudItemList = studyCrudService.getCrudItemList();
        model.addAttribute("crudItemList", crudItemList);
        return "views/study/crud/crudMain";
    }*/
	
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String detailView(Model model, HttpSession session,@RequestParam("perfId") int perfId){
		/*널이 아니며 빈 문자열이 아니면 로그인 되어있는것*/  
		if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")){
			model.addAttribute("login", true);
		}else{
			model.addAttribute("login", false);
		}
		Performance perfInfo = service.getPerfInfo(perfId);
		model.addAttribute("perfInfo", perfInfo);
		return "/detail/detail";
	}
}
