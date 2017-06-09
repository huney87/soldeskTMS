package gwangjae.tms.admin.controller;

import gwangjae.tms.admin.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired private AdminService adminService;
	
	@RequestMapping
	public String main(){
		return "admin/adminMain";
	}
}
