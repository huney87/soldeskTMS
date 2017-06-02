package gwangjae.tms.performance.service;

import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceService {
	public List<SeatInfo> getSeats(String title);
	public int addSeats(String[] seats);
}
