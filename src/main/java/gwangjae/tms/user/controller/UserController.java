package gwangjae.tms.user.controller;

import gwangjae.tms.user.domain.User;
import gwangjae.tms.user.service.UserService;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired UserService userService;
	
	@RequestMapping
	public String main(){
		return "sign/main";
	}
	
	@RequestMapping("/find")
	public String find(){
		return "sign/find";
	}
	
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	@ResponseBody
	public int addUser(User user){
		return userService.addUser(user);
	}
	
	//비밀번호 설정시 조건 설정
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public String validate(String pw){
		String result = "BAD.";
		String pwPolicy = "((?=.*[a-zA-Z])(?=.*[0-9]).{6,14})";	//영문 대소문자, 숫자 혼용 6~14 자리 사이 사용
		Pattern pattern = Pattern.compile(pwPolicy);
		Matcher matcher = pattern.matcher(pw);
		if(matcher.matches()) result = "GOOD.";
    return result;
	}
	
	@RequestMapping("/checkUserEmail")
	@ResponseBody
	public User checkUserEmail(User userEmail){
		return userService.checkUserEmail(userEmail);
	}
	
	@RequestMapping("/findId")
	@ResponseBody
	public String findUserId(User user){
		return userService.findUserId(user);
	}
	
	@RequestMapping("/findPw")
	@ResponseBody
	public String findUserPw(User user){
		return userService.findUserPw(user);
	}
}
