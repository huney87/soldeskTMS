package gwangjae.tms.performance.service;

import gwangjae.tms.hall.domain.Hall;
import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceService {
	public List<SeatInfo> getSeats(String title);
	public int addSeats(String[] seats, int perId);
	public List<Performance> getPer(String per_name);
	public int addPerInfo(Performance performance);
	public int addPerDetail(Performance performance);
	public List<Performance> getHalls(int centerId);
	public Hall getLayout(int per_id);
	public int maxGrade(int per_id);
	public int updateSeatsInfo(SeatInfo sinfo);
	public int seatInfoInit(SeatInfo sinfo);
}
