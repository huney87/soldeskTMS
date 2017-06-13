package gwangjae.tms.mypage.controller;

import java.util.List;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.mypage.service.MypageService;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired private MypageService mypageService;
	
	@RequestMapping
	public String main(){
		return "mypage/mypage1";
	}
	
	@RequestMapping("/mypage2")
	public List<Reservation> getReservations(){
		return mypageService.getReservations();
	} 
}
