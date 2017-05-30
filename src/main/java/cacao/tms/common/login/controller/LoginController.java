package cacao.tms.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cacao.tms.common.login.domain.LoginResult;
import cacao.tms.common.login.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired LoginService serv ;
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	@ResponseBody
	public LoginResult check(String email, String pw, HttpSession session){		
		LoginResult result = new LoginResult();
		result.setEmail(email);
		
		if(serv.checkLogin(email, pw)){			
			result.setLoginFlag(1);
			session.setAttribute("email", email);
		}else {
			result.setLoginFlag(0);
		}		
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.setAttribute("email", "");
		return "redirect:/";
	}
}
