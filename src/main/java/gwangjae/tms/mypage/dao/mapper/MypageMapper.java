package gwangjae.tms.mypage.dao.mapper;

import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

public interface MypageMapper {
	List<Reservation> getReservations();
	int delReservation(int delId);
}
