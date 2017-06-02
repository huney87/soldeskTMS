package gwangjae.tms.hall.controller;

import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.Seat;
import gwangjae.tms.hall.service.HallService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/hallManage")
public class HallController {
	@Autowired private HallService hallService;
	
	@RequestMapping
    public String main(){
        return "seller/hallMain";
    }
	
	@RequestMapping("/cenAdd")
    public String centerAdd(){
        return "seller/centerAdd";
    }
	
	
	//회관 목록
	@RequestMapping("/getCenters")
    @ResponseBody
	public List<Center> getCenters(){
		return hallService.getCenters();
	}
	//회관 하나 찾기
	@RequestMapping("/getCenter")
    @ResponseBody
	public Hall getCenter(String Center_name){
		return hallService.getCenter(Center_name);
	}
	//회관 추가
	@RequestMapping("/addCenter")
    @ResponseBody
	public int addCenter(String Center_name){
		return hallService.addCenter(Center_name);
	}
	//회관 삭제
	@RequestMapping("/delCenter")
    @ResponseBody
	public int delCenter(String Center_name){
		return hallService.delCenter(Center_name);
	}
	//회관 수정
	@RequestMapping("/modCenter")
    @ResponseBody
	public int modCenter(String Center_name){
		return hallService.modCenter(Center_name);
	}
//////////////////////////////////////////////////////////////////	
	
	//공연장 목록
	@RequestMapping("/getHalls")
    @ResponseBody
	public List<Hall> getHalls(){
		return hallService.getHalls();
	}
	//상영관 하나 찾기
	@RequestMapping("/getHall")
    @ResponseBody
	public Hall getHall(String hall_name){
		return hallService.getHall(hall_name);	
	}
	//상영관 추가
	@RequestMapping("/addHall")
    @ResponseBody
	public int addHall(String hall_name){
		return hallService.addHall(hall_name);
	}
	//상영관 삭제
	@RequestMapping("/delHall")
    @ResponseBody
	public int delHall(String hall_name){
		return hallService.delHall(hall_name);
	}
	//상영관 수정
	@RequestMapping("/modHall")
    @ResponseBody
	public int modHall(String hall_name){
		return hallService.modHall(hall_name);
	}
	
	
//////////////////////////////////////////////////////////////////	
	//상영관별 좌석 목록
	@RequestMapping("/getSeats")
    @ResponseBody
	public List<Seat> getSeats(int hall_name){
		return hallService.getSeats(hall_name);
	}
	//좌석 추가
	@RequestMapping("/addSeat")
    @ResponseBody
	public int addSeat(String Seat_name){
		return hallService.addSeat(Seat_name);
	}
	//좌석 삭제
	@RequestMapping("/delSeat")
    @ResponseBody
	public int delSeat(String Seat_name){
		return hallService.delSeat(Seat_name);
	}
	//좌석 수정
	@RequestMapping("/modSeat")
    @ResponseBody
	public int modSeat(String Seat_name){
		return hallService.modSeat(Seat_name);
	}
}
