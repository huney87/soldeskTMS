package gwangjae.tms.performance.dao;

import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.hall.domain.Seat;
import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceDao {
	public List<SeatInfo> getSeats(String title);
	public SeatInfo seatinfoForTicket(Seat seat);
	public List<Seat> getPerLayout(int perId);
	public int addSeat(Seat seat);
	public List<Performance> getPer(String per_name);
	public int addPerInfo(Performance performance);
	public int addPerDetail(Performance performance);
	public List<Performance> getHalls(int centerId);
	public Hall getLayout(int per_id);
	public int maxGrade(int per_id);
	public int updateSeatsInfo(SeatInfo sinfo);
	public int seatInfoInit(SeatInfo sinfo);
	public int addRound(Round round);
	public List<Seat> getResSeat(Round round);
}
