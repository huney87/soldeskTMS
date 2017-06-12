package gwangjae.tms.admin.controller;

import java.util.List;

import gwangjae.tms.admin.service.AdminService;
import gwangjae.tms.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	@Autowired private AdminService adminService;
	
	@RequestMapping("/admin")
	public String main(){
		return "admin/adminMain";
	}
	
	@RequestMapping("admin/listUsers")
	@ResponseBody
	public List<User> listUsers(){
		return adminService.getUsers();
	}
	
	@RequestMapping("admin/searchUser")
	@ResponseBody
	public List<User> searchUser(String userName){
		return adminService.searchUser(userName);
	}
	
	@RequestMapping("admin/delete")
	@ResponseBody
	public int delUsers(int userId){
		return adminService.delUsers(userId);
	}
}
