package gwangjae.tms.performance.dao;

import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceDao {
	public List<SeatInfo> getSeats(String title);
	public int addSeat(int seat);
}
