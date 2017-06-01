package gwangjae.tms.performance.controller;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.service.PerformanceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class PerformanceController {
	@Autowired PerformanceService serv;
	
	@RequestMapping("/musical")
	@ResponseBody
	public Performance perform(int category){
		return serv.getPerCategory(category);
	}
}
