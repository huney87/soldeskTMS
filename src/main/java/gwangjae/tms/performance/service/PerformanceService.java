package gwangjae.tms.performance.service;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceService {
	public List<SeatInfo> getSeats(String title);
	public int addSeats(String[] seats);
	public List<Performance> getPer(String per_name);
	public int addPerDetail(Performance performance);
}
