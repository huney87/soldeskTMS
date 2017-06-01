package gwangjae.tms.ticketing.controller;

import gwangjae.tms.ticketing.service.TicketingService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ticket")
public class TicketingController {
	@Autowired TicketingService service;
	
	@RequestMapping
	public String initView(Model model){
		return "/ticket/01";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String mainView(HttpSession session, Model model,
			@RequestParam("step") int step){
		String view = "/ticket/" + String.format("%02d", step);
		model.addAttribute("step", step);
		return view;
	}
	
	@RequestMapping("/panel")
	public String panelView(){
		return "/ticket/control-panel";
	}
	
	@RequestMapping("/layout")
	public String layoutView(HttpSession session, Model model){		
		return "/ticket/seat-select";
	}
	
	@RequestMapping("/getlayout")
	@ResponseBody
	public String[][] getLayout(HttpSession session){
		return service.drawLayout();
	}
}