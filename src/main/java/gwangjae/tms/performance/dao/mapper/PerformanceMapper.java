package gwangjae.tms.performance.dao.mapper;

import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceMapper {
	public List<SeatInfo> getSeats(String title);
	public int addSeat(int seat);
}
