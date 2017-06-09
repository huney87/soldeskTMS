package gwangjae.tms.performance.dao.mapper;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;

import java.util.List;

public interface PerformanceMapper {
	public List<SeatInfo> getSeats(String title);
	public int addSeat(int seat);
	public List<Performance> getPer(String per_name);
	public int addPerInfo(Performance performance);
	public int addPerDetail(Performance performance);
	public List<Performance> getHalls(int centerId);
	public int getLayout(int hallId);
}
