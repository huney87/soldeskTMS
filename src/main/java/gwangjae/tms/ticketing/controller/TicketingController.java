package gwangjae.tms.ticketing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ticket")
public class TicketingController {
	@RequestMapping
	public String initView(Model model){
		return "/ticket/01";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String mainView(HttpSession session, Model model,
			@RequestParam("step") int step){
		String view = "/ticket/" + String.format("%02d", step);
		return view;
	}
	
	@RequestMapping("/panel")
	public String panelView(){
		return "/ticket/control-panel";
	}
}