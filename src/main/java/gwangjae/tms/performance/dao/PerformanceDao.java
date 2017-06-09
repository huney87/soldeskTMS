package gwangjae.tms.performance.dao;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceDao {
	public List<SeatInfo> getSeats(String title);
	public int addSeat(int seat);
	public List<Performance> getPer(String per_name);
	public int addPerDetail(Performance performance);
}
