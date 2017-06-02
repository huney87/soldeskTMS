package gwangjae.tms.performance.controller;

import java.util.List;

import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.performance.service.PerformanceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/seller")
public class PerformanceController {
	@Autowired PerformanceService performanceService;
	
	@RequestMapping
    public String main(){
        return "seller/sellerMain";
    }
	
	@RequestMapping("/perAdd")
    public String perAdd(){
        return "seller/sellerPerAdd";
    }
	
	@RequestMapping("/getSeats")
    @ResponseBody
	public List<SeatInfo> getSeats(String title){
		return performanceService.getSeats(title);
	}
	
	@RequestMapping("/addSeats")
    @ResponseBody
    public int addSeats(
    		@RequestParam(value="seats[]") List<String> seats){
		return performanceService.addSeats(seats.toArray(new String[seats.size()]));
	}
	
}
