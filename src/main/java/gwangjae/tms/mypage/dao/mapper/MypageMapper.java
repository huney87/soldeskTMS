package gwangjae.tms.mypage.dao.mapper;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface MypageMapper {
	public List<Reservation> getReserve();
	public int deleteReserve(int reserveId);
	
	public int delUser(User user);
}
