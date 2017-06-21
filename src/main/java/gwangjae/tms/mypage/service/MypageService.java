package gwangjae.tms.mypage.service;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface MypageService {
	List<Reservation> getReserve();
	int deleteReserve(int reserveId);
	User getUser(String userEmail);
	int udpUser(User user);
	int delUser(User user);
}
