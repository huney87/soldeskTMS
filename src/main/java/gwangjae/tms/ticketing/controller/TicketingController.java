package gwangjae.tms.ticketing.controller;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.domain.Reservations;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;
import gwangjae.tms.ticketing.service.TicketingService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	////////////// 기능
	
	@RequestMapping("/setReserv")// 예매하고 예매번호 가져오기
	@ResponseBody
	public int setReserv(Reservations reservation){
		return service.setReserv(reservation);
	}	
	
	@RequestMapping("/getReservResult")// 예매번호가 포함된 정보로 예매상세DB 저장.
	@ResponseBody
	public Reservations getReservResult(Reservations reservation){
		return service.getReservResult(reservation);
	}	
	
	@RequestMapping("/setRevDetail")// 예매번호가 포함된 정보로 예매상세DB 저장.
	@ResponseBody
	public int setRevDetail(Reservations reservation){
	return service.setRevDetail(reservation);
	}
	
	@RequestMapping("/getlayout")
	@ResponseBody
	public String[][] getLayout(HttpSession session){
		return service.drawLayout(0);
	}

	@RequestMapping("/getskd")
	@ResponseBody
	public Round[] getSkd(HttpSession session,
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
	
	@RequestMapping(value="/getPerformanceInfo",method=RequestMethod.GET)
	@ResponseBody
	public Performance getPerfInfo(@RequestParam("perf_Id") int perfId){
		Performance perfInfo = service.getPerfInfo(perfId);
		return perfInfo;
	}
	
	@RequestMapping(value="/getPerSeatInfo",method=RequestMethod.GET,produces="application/json")
	@ResponseBody
	public Map<String,Object> getPerfSeatInfo(HttpSession session,@RequestParam("performanceID") int perfId){
		Map<String,Object> resultMap = new HashMap<>();
        List<SeatInfo> seatList = service.getPerfSeatInfo(perfId);
        resultMap.put("seatList",seatList);
        return resultMap;
	}
}