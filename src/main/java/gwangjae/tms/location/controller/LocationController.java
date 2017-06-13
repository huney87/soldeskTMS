package gwangjae.tms.location.controller;

import gwangjae.tms.location.domain.Location;
import gwangjae.tms.location.service.LocationService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value="locationController")
@RequestMapping("/location")
public class LocationController {
	@Autowired
	@Qualifier("locationService")
	LocationService locationService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String moveToLocationMainPage(Model model){
		List<Location> locationList = locationService.getLocationeList();
		model.addAttribute("locationList",locationList);
		return "/admin/location";
	}
}
