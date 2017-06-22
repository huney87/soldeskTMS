package gwangjae.tms.performance.service;

import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.Seat;
import gwangjae.tms.performance.dao.PerformanceDao;
import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
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
	
	 public int addSeats(String[] seats,int perId){
		 Seat seat= new Seat();		 
		 int cnt=1;// 좌석이 몇개 들어갔는지 확인을 위한 변수

		 for(String tmp:seats){
			 //seats 는 01011 과 같이 row+col+type 순서임.		 
			 seat.setSeatRow(Integer.parseInt(tmp.substring(0, 2))); //자릿수 0번째 포함 2번째전까지 
			 seat.setSeatCol(Integer.parseInt(tmp.substring(2, 4)));
			 seat.setSeatType(Integer.parseInt(tmp.substring(4)));
			 seat.setSeatNumber(cnt);cnt++;
			 seat.setPer_id(perId);
			 
			 performanceDao.addSeat(seat);		 
		 }System.out.println(3);
		return 1;
	}
	 
	 public List<Seat> getPerLayout(int perId){	 
		 return performanceDao.getPerLayout(perId);
	 }
	 
	 public List<Performance> getPer(String per_name){
		 return performanceDao.getPer(per_name);
	 }
	 
	 public int addPerInfo(Performance performance){
		 return performanceDao.addPerInfo(performance);
	 }
	 
	 public int addPerDetail(Performance performance){
			return performanceDao.addPerDetail(performance);
	}
	 public List<Performance> getHalls(int centerId){
			return performanceDao.getHalls(centerId);
	}
	public Hall getLayout(int per_id){
			return performanceDao.getLayout(per_id);
	}
	public int maxGrade(int per_id){
		return performanceDao.maxGrade(per_id);
	}
	
	public int updateSeatsInfo(SeatInfo sinfo){
		return performanceDao.updateSeatsInfo(sinfo);
	}
	
	public int seatInfoInit(SeatInfo sinfo){
		return performanceDao.seatInfoInit(sinfo);
	}
	
	public int addRound(String[] dates, String[] time1,String[] time2, int perId){
		Round round = new Round();
		
		for(int i=0;i< dates.length ;i++){
			round.setPerId(perId);
			round.setRoundDate(dates[i]);
			round.setRoundTime(time1[i]);
			performanceDao.addRound(round);// 회당 1차시간 저장
			
			round.setRoundTime(time2[i]);
			performanceDao.addRound(round);// 회당 2차시간 저장
		}
		
		return 1;
	}
}