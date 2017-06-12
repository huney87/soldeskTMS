package gwangjae.tms.mypage.service;

import gwangjae.tms.mypage.dao.MypageDao;
import gwangjae.tms.mypage.domain.Reservation;

import java.util.List;


public class MypageServiceImpl implements MypageService{
	private MypageDao dao;
	
	public List<Reservation> reserveInfo(){
		return dao.getReservations();
	}
	
	public int reserveCancel(int delId){
		return dao.delReservation(delId);
	}
}
