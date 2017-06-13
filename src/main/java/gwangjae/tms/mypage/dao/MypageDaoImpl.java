package gwangjae.tms.mypage.dao;

import gwangjae.tms.mypage.dao.mapper.MypageMapper;
import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired private MypageMapper mapper;

	@Override
	public List<Reservation> getReservations() {
		return mapper.getResevations();
	}
	
}