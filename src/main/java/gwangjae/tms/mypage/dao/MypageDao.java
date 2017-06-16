package gwangjae.tms.mypage.dao;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface MypageDao {
	List<Reservation> getReserve();
	int deleteReserve(int reserveId);
	
	int delUser(User user);
}
