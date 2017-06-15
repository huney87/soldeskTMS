package gwangjae.tms.admin.controller;

import java.util.List;

import gwangjae.tms.admin.domain.AdminPerformance;
import gwangjae.tms.admin.service.AdminService;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired private AdminService adminService;
	
	@RequestMapping
	public String main(){
		return "admin/admin1";
	}
	
	@RequestMapping("/admin2")
	public String admin2(){
		return "admin/admin2";
	} 
	
	@RequestMapping("/listUsers")
	@ResponseBody
	public List<User> listUsers(){
		return adminService.getUsers();
	}
	
	@RequestMapping("/searchUser")
	@ResponseBody
	public List<User> searchUser(String userName){
		return adminService.searchUser(userName);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delUsers(int userId){
		return adminService.delUsers(userId);
	}
	
	@RequestMapping("/admin2/listPerform")
	@ResponseBody
	public List<AdminPerformance> listPerform(){
		return adminService.getPerform();
	}
}
