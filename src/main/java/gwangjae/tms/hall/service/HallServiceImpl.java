package gwangjae.tms.hall.service;

import gwangjae.tms.hall.dao.HallDao;
import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.HallTable;
import gwangjae.tms.hall.domain.Seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HallServiceImpl implements HallService{
@Autowired private HallDao hallDao;
	
	//회관 목록
	public List<Center> getCenters(){
		return hallDao.getCenters();
	}
	//회관 하나 찾기
	public List<Center> getCenter(String Center_name){
		return hallDao.getCenter(Center_name);
	}
	//지역번호로 회관목록 보기
	public List<Center> centerOfArea(int locId){
		return hallDao.centerOfArea(locId);
	}
	//회관 추가
	public int addCenter(Center center){
		return hallDao.addCenter(center);
	}
	
	//회관 삭제
	public int delCenter(String Center_name){
		return hallDao.delCenter(Center_name);
	}
	//회관 수정
	public int modCenter(String Center_name){
		return hallDao.modCenter(Center_name);
	}
//////////////////////////////////////////////////////////////////	
	
	//공연장 목록
	public List<HallTable> getHalls(){
		return hallDao.getHalls();
	}
	//공연장 검색 하기
	public List<HallTable> searchHalls(String hall_name){
		return hallDao.searchHalls(hall_name);	
	}
	//상영관 하나 찾기
	public Hall getHall(String hall_name){
		return hallDao.getHall(hall_name);	
	}
	//상영관 추가
	public int addHall(Hall hall){
		return hallDao.addHall(hall);
	}
	//상영관 삭제
	public int delHall(String hall_name){
		return hallDao.delHall(hall_name);
	}
	//상영관 수정
	public int modHall(String hall_name){
		return hallDao.modHall(hall_name);
	}
	
	
//////////////////////////////////////////////////////////////////	
	//상영관별 좌석 목록
	public List<Seat> getSeats(int hall_name){
		return hallDao.getSeats(hall_name);
	}
	//좌석 추가
	public int addSeat(String Seat_name){
		return hallDao.addSeat(Seat_name);
	}
	//좌석 삭제
	public int delSeat(String Seat_name){
		return hallDao.delSeat(Seat_name);
	}
	//좌석 수정
	public int modSeat(String Seat_name){
		return hallDao.modSeat(Seat_name);
	}
}
