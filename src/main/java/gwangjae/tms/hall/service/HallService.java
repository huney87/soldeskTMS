package gwangjae.tms.hall.service;

import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.Seat;

import java.util.List;

public interface HallService {
	List<Center> getCenters();  		//회관 목록
	Hall getCenter(String Center_name); //회관 하나 찾기
	int addCenter(String Center_name);  //회관 추가
	int delCenter(String Center_name);	//회관 삭제
	int modCenter(String Center_name);	//회관 수정
	
	List<Hall> getHalls();      		//공연장 목록
	Hall getHall(String hall_name); 	//상영관 하나 찾기
	int addHall(String hall_name); 	 	//상영관 추가
	int delHall(String hall_name);		//상영관 삭제
	int modHall(String hall_name);		//상영관 수정
	
	List<Seat> getSeats(int hall_name);		//상영관별 좌석 목록
	int addSeat(String Seat_name);  		//좌석 추가
	int delSeat(String Seat_name);			//좌석 삭제
	int modSeat(String Seat_name);			//좌석 수정

}
