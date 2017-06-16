package gwangjae.tms.mypage.service;

import gwangjae.tms.mypage.dao.MypageDao;
import gwangjae.tms.mypage.domain.Reservation;
import gwangjae.tms.user.domain.User;

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

	@Override
	public int delUser(User user) {
		return dao.delUser(user);
	}
}
