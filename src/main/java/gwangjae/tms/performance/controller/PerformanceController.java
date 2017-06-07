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
	
	//메인화면
	@RequestMapping
    public String main(){
        return "seller/sellerMain";
    }
	
	//공연 추가 화면
	@RequestMapping("/perAdd")
    public String perAdd(){
        return "seller/sellerPerAdd";
    }
	//공연 상세정보 등록 화면
	@RequestMapping("/perDetail")
	public String perDetail(){
		return "seller/perDetail";
	}
	
	///////////////////////////////////////////////
	//좌석정보 가져오기
	@RequestMapping("/getSeats")
    @ResponseBody
	public List<SeatInfo> getSeats(String title){
		return performanceService.getSeats(title);
	}
	
	//좌석 추가하기
	@RequestMapping("/addSeats")
    @ResponseBody
    public int addSeats(
    		@RequestParam(value="seats[]") List<String> seats){
		return performanceService.addSeats(seats.toArray(new String[seats.size()]));
	}
	
}
