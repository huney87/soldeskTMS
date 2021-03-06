package gwangjae.tms.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.mypage.service.MypageService;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired private MypageService mypageService;
	
	@RequestMapping
	public String main(){
		return "mypage/mypage2";
	}
	
	@RequestMapping("/mypage1")
	public String mypage1(Model model, HttpSession session){
		Object email = session.getAttribute("email");
        model.addAttribute("email", email);
		return "mypage/mypage1";
	}  
	
	@RequestMapping("/mypage3")
	public String mypage3(){
		return "mypage/mypage3";
	} 
	
	@RequestMapping(value = "/mypage4", method = RequestMethod.GET)
	public String mypage4(Model model,HttpSession session){
		Object email = session.getAttribute("email");
        model.addAttribute("email", email);
		return "mypage/mypage4";
	} 
	
	@RequestMapping("/reservelist")
	@ResponseBody
	public List<Reservation> getReservations(String userEmail){
		return mypageService.getReserve(userEmail);
	} 
	
	@RequestMapping("/reserveDelete")
	@ResponseBody
	public int delReserve(int reserveId){
		return mypageService.deleteReserve(reserveId);
	}
	
	@RequestMapping("/getUser")
	@ResponseBody
	public User getUser(String userEmail){
		return mypageService.getUser(userEmail);
	}
	
	@RequestMapping("/updUser")
	@ResponseBody
	public int updUser(User user){
		return mypageService.udpUser(user);
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	public int delUser(User user){
		return mypageService.delUser(user);
	}
}
