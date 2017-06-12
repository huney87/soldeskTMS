package gwangjae.tms.category.dao.mapper;

import gwangjae.tms.category.domain.Location;

import java.util.List;

public interface LocationMapper {
	List<Location> getLocationes(); //목록보기
	Location getLocation(int locationId); //한개보기
	void addLocation(Location location); //추가
	void modLocation(Location location); //수정
	void remLocation(int locationId); //삭제
}
