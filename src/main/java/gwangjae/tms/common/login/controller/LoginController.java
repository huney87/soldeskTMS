package gwangjae.tms.common.login.controller;

import gwangjae.tms.common.login.domain.LoginResult;
import gwangjae.tms.common.login.service.LoginService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired LoginService serv ;
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public LoginResult check(String email, String pw, HttpSession session){		
		LoginResult result = new LoginResult();
		result.setEmail(email);
		
		if(serv.checkLogin(email, pw) >= 1){
			int idx = serv.checkLogin(email, pw);
			result.setLoginFlag(1);
			session.setAttribute("email", email);
			session.setAttribute("user_type", idx);
		}else {
			result.setLoginFlag(0);
		}		
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
