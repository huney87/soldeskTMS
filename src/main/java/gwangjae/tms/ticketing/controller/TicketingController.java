package gwangjae.tms.ticketing.controller;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;
import gwangjae.tms.ticketing.service.TicketingService;

import java.sql.Date;
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
	
	@RequestMapping("/payment")
	public String payment(){
		return "/ticket/06";
	}
	
	@RequestMapping("/layout")
	public String layoutView(HttpSession session, Model model){		
		return "/ticket/seat-select";
	}
	
	@RequestMapping("/getlayout")
	@ResponseBody
	public String[][] getLayout(HttpSession session){
		return service.drawLayout(0);
	}

	@RequestMapping("/getskd")
	@ResponseBody
	public Date[] getSkd(HttpSession session,
			@RequestParam("performance_id") int perfId){
		return service.getPerfSkd(perfId);
	}
	
	@RequestMapping("/getseatinfo")
	@ResponseBody
	public TicketSeatInfo[][] getSeatInfo(
			@RequestParam("performance_id") int perfId){
		return service.getSquareSeatLayout(perfId);
	}
	
	//
	@RequestMapping("/getPerformanceDate")
	@ResponseBody
	public Performance getPerfDate(int perfId){
		return service.getPerfDate(perfId);
	}
}