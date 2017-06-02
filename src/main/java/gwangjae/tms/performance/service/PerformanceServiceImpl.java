package gwangjae.tms.performance.service;

import gwangjae.tms.performance.dao.PerformanceDao;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	@Autowired private PerformanceDao performanceDao;
	
	public List<SeatInfo> getSeats(String title){
		return performanceDao.getSeats(title);
	}
	
	 public int addSeats(String[] seats){
		 int check=0;// 좌석이 몇개 들어갔는지 확인을 위한 변수
		 for(String seat:seats){
			 performanceDao.addSeat(Integer.parseInt(seat));
			 check++;
		 }System.out.println(check);
			return check;
	}
}