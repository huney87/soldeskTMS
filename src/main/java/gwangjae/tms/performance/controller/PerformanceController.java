package gwangjae.tms.performance.controller;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.performance.service.PerformanceService;

import java.util.List;

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
	@RequestMapping("/perMain")
    public String perMain(){
        return "seller/perMain";
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
    public int addSeats(@RequestParam(value="seats[]") List<String> seats){
		return performanceService.addSeats(seats.toArray(new String[seats.size()]));
	}
	
	//공연 검색하기(검색어로)
	@RequestMapping("/getPer")
    @ResponseBody
    public List<Performance> getPer(String per_name){
    		List<Performance> result = performanceService.getPer(per_name);
		return result;
	}
	
	//공연장 리스트 불러오기
	@RequestMapping("/getHalls")
	@ResponseBody
	public List<Performance> getHalls(int centerId){
		List<Performance> result = performanceService.getHalls(centerId);
		return result;
	}
	
	//공연 회차정보 등록
	@RequestMapping("/addPerInfo")
    @ResponseBody
    public int addPerInfo(Performance performance){
		return performanceService.addPerInfo(performance);
	}
	
	//공연 회차정보 등록
	@RequestMapping("/addPerDetail")
    @ResponseBody
    public int addPerDetail(Performance performance){
		return performanceService.addPerDetail(performance);
	}
	
	//좌석 레이아웃 불러오기
	@RequestMapping("/getLayout")
    @ResponseBody
    public int getLayout(int hallId){
		return performanceService.getLayout(hallId);
	}
	
	
	
}
