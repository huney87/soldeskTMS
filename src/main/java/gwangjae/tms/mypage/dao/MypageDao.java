package gwangjae.tms.mypage.dao;

import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

public interface MypageDao {
	List<Reservation> getReservations();
}
