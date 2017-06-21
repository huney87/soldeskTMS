package gwangjae.tms.hall.dao;

import gwangjae.tms.hall.dao.mapper.HallMapper;
import gwangjae.tms.hall.domain.Center;
import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.HallTable;
import gwangjae.tms.hall.domain.Seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HallDaoImpl implements HallDao{
	@Autowired private HallMapper hallMapper;
	
	//회관 목록
	public List<Center> getCenters(){
		return hallMapper.getCenters();
	}
	//회관 하나 찾기
	public List<Center> getCenter(String Center_name){
		return hallMapper.getCenter(Center_name);
	}
	//지역번호로 회관검색
	public List<Center> centerOfArea(int locId){
		return hallMapper.centerOfArea(locId);
	}
	//회관 추가
	public int addCenter(Center center){
		return hallMapper.addCenter(center);
	}
	//회관 삭제
	public int delCenter(String Center_name){
		return hallMapper.delCenter(Center_name);
	}
	//회관 수정
	public int modCenter(String Center_name){
		return hallMapper.modCenter(Center_name);
	}
//////////////////////////////////////////////////////////////////	
	
	//공연장 목록
	public List<HallTable> getHalls(){
		return hallMapper.getHalls();
	}
	//공연장 검색 하기
	public List<HallTable> searchHalls(String hall_name){
		return hallMapper.searchHalls(hall_name);	
	}
	//상영관 하나 찾기
	public Hall getHall(String hall_name){
		return hallMapper.getHall(hall_name);	
	}
	//상영관 추가
	public int addHall(Hall hall){
		return hallMapper.addHall(hall);
	}
	//상영관 삭제
	public int delHall(String hall_name){
		return hallMapper.delHall(hall_name);
	}
	//상영관 수정
	public int modHall(String hall_name){
		return hallMapper.modHall(hall_name);
	}
	
	
//////////////////////////////////////////////////////////////////	
	//상영관별 좌석 목록
	public List<Seat> getSeats(int hall_name){
		return hallMapper.getSeats(hall_name);
	}
	//좌석 추가
	public int addSeat(String Seat_name){
		return hallMapper.addSeat(Seat_name);
	}
	//좌석 삭제
	public int delSeat(String Seat_name){
		return hallMapper.delSeat(Seat_name);
	}
	//좌석 수정
	public int modSeat(String Seat_name){
		return hallMapper.modSeat(Seat_name);
	}

}
