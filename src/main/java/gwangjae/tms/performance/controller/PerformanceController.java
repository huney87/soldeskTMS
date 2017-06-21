package gwangjae.tms.performance.controller;

import gwangjae.tms.hall.domain.Hall;
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
	
	//공연 탭 메인
	@RequestMapping("/perMain")
    public String perMain(){
        return "seller/perMain";
    }
	
	//공연 등록1 (기본정보 등록화면)
	@RequestMapping("/perAdd1")
	public String perAdd1(){
		return "seller/perAdd1";
	}
	
	//공연 추가 화면
	@RequestMapping("/perAdd2")
    public String perAdd2(){
        return "seller/perAdd2";
    }
	//공연 상세정보 등록 화면
	@RequestMapping("/perAdd3")
	public String perAdd3(){
		return "seller/perAdd3";
	}
	//공연 검색출력
	@RequestMapping("/perSearch")
	public String perSearch(){
		return "seller/perSearch";
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
    public int addSeats(@RequestParam(value="seats[]") List<String> seats,
    		@RequestParam(value="perId") int perId){
		return performanceService.addSeats(seats.toArray(new String[seats.size()]), perId);
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
    public Hall getLayout(int per_id){
		return performanceService.getLayout(per_id);
	}
	
	//최대 등급가져오기
	@RequestMapping("/maxGrade")
    @ResponseBody
    public int maxGrade(int per_id){
		return performanceService.maxGrade(per_id);
	}
	
	//좌석 정보 등록하기(등급이름, 가격 등)
	@RequestMapping("/updateSeatsInfo")
    @ResponseBody
    public int updateSeatsInfo(SeatInfo sinfo){
		return performanceService.updateSeatsInfo(sinfo);
	}
	
	//좌석 정보 등록초기화(좌석등록시 실행)
	@RequestMapping("/seatInfoInit")
	@ResponseBody
	public int seatInfoInit(SeatInfo sinfo){
		return performanceService.seatInfoInit(sinfo);
	}
	
	//회차 정보 저장하기 : 3개의 배열값을 가져옴(날짜, 시간1, 시간2)
	@RequestMapping("/addRound")
    @ResponseBody
    public int addRound(@RequestParam(value="dates[]") List<String> dates,
    		@RequestParam(value="time1[]") List<String> time1,
    		@RequestParam(value="time2[]") List<String> time2,
    		@RequestParam(value="perId") int perId){
		return performanceService.addRound(dates.toArray(new String[dates.size()]),
				time1.toArray(new String[time1.size()]),
				time2.toArray(new String[time2.size()]),
				perId);
	}
}
