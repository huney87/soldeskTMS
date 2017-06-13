package gwangjae.tms.mypage.controller;

import gwangjae.tms.mypage.service.MypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@Autowired private MypageService mypageService;
	
	@RequestMapping("/mypage")
	public String main(){
		return "mypage/mypage2";
	}
}
