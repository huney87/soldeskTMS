package gwangjae.tms.user.controller;

import gwangjae.tms.user.domain.User;
import gwangjae.tms.user.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired UserService userService;
	
	@RequestMapping
	public String main(){
		return "sign/main";
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public int addUser(User user){
		return userService.addUser(user);
	}

}
