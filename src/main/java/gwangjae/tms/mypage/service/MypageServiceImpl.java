package gwangjae.tms.mypage.service;

import gwangjae.tms.mypage.dao.MypageDao;
import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired private MypageDao dao;

	public List<Reservation> getReserve() {
		return dao.getReserve();
	}

	public int deleteReserve(int reserveId) {
		return dao.deleteReserve(reserveId);
	}
}
