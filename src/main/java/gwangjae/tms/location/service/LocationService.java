package gwangjae.tms.location.service;

import java.util.List;

import gwangjae.tms.location.dao.mapper.LocationMapper;
import gwangjae.tms.location.domain.Location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("locationService")
public class LocationService {
	@Autowired 
	@Qualifier("locationMapper")
	LocationMapper locationMapper;
	
	public List<Location> getLocationeList(){
		return locationMapper.selectLocationList();
	}
	
	public Location getLocation(Location param){
		return locationMapper.selectLocation(param);
	}
	
	public void addLocation(Location param){
		locationMapper.insertLocation(param);
	}
	
	public void modifyLocation(Location param){
		locationMapper.updateLocation(param);
	}
	
	public void removeLocation(Location param){
		locationMapper.delectLocation(param);
	}
}
