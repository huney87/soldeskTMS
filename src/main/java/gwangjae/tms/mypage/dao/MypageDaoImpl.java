package gwangjae.tms.mypage.dao;

import gwangjae.tms.mypage.dao.mapper.MypageMapper;
import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired private MypageMapper mapper;

	@Override
	public List<Reservation> getReserve(String userEmail) {
		return mapper.getReserve(userEmail);
	}

	@Override
	public int deleteReserve(int reserveId) {
		return mapper.deleteReserve(reserveId);
	}
	
	public User getUser(String userEmail){
		return mapper.getUser(userEmail);
	}
	
	public int udpUser(User user){
		return mapper.udpUser(user);
	}
	
	@Override
	public int delUser(User user) {
		return mapper.delUser(user);
	}
	
}