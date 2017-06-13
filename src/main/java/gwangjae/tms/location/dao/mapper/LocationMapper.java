package gwangjae.tms.location.dao.mapper;

import gwangjae.tms.location.domain.Location;

import java.util.List;

public interface LocationMapper {
	List<Location> selectLocationList(); //목록보기
	Location selectLocation(Location param); //한개보기
	void insertLocation(Location param); //추가
	void updateLocation(Location param); //수정
	void delectLocation(Location param); //삭제
}
