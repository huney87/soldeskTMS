package gwangjae.tms.hall.dao.mapper;

import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.Seat;

import java.util.List;

public interface HallMapper {
	public List<Center> getCenters();  					//회관 목록
	public List<Center> getCenter(String Center_name); 	//회관 하나 찾기
	public List<Center> centerOfArea(int locId); 			//지역번호로 회관검색
	public int addCenter(Center center);  					//회관 추가
	public int delCenter(String Center_name);				//회관 삭제
	public int modCenter(String Center_name);				//회관 수정
	
	public List<Hall> getHalls();      	//공연장 목록
	public List<Hall> searchHalls(String hall_name); //공연장 검색하기
	public Hall getHall(String hall_name); //상영관 하나 찾기
	public int addHall(Hall hall);  //상영관 추가
	public int delHall(String hall_name);	//상영관 삭제
	public int modHall(String hall_name);	//상영관 수정
	
	public List<Seat> getSeats(int hall_name);		//상영관별 좌석 목록
	public int addSeat(String Seat_name);  		//좌석 추가
	public int delSeat(String Seat_name);			//좌석 삭제
	public int modSeat(String Seat_name);			//좌석 수정

}
