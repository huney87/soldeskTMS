package gwangjae.tms.category.service;

import java.util.List;

import gwangjae.tms.category.dao.mapper.LocationMapper;
import gwangjae.tms.category.domain.Location;

import org.springframework.beans.factory.annotation.Autowired;

public class LocationService {
	@Autowired private LocationMapper locationMapper;
	
	public List<Location> locationeViewList(){
		return locationMapper.getLocationes();
	}
	
	public Location locationViewInfo(int locationId){
		return locationMapper.getLocation(locationId);
	}
	
	public void locationAddInfo(Location location){
		locationMapper.addLocation(location);
	}
	
	public void locationModifyInfo(Location location){
		locationMapper.modLocation(location);
	}
	
	public void locationRemoveInfo(int locationId){
		locationMapper.remLocation(locationId);
	}
}
