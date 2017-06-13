package gwangjae.tms.mypage.dao;

import gwangjae.tms.mypage.dao.mapper.MypageMapper;
import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{
	private MypageMapper mapper;
	
	public List<Reservation> getReservations(){
		return mapper.getReservations();
	}
	
	public int delReservation(int delId){
		return mapper.delReservation(delId);
	}
}