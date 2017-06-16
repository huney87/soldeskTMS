package gwangjae.tms.mypage.dao.mapper;

import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

import java.util.List;

public interface MypageMapper {
	public List<Reservation> getReserve();
	public int deleteReserve(int reserveId);
	public User getUser(int userNo);
	public User udpUser(User user);
	public int delUser(User user);
}
