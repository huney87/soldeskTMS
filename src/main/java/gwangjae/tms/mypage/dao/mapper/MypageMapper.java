package gwangjae.tms.mypage.dao.mapper;

import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

public interface MypageMapper {
	public List<Reservation> getReserve();
	public int deleteReserve(int reserveId);
}
