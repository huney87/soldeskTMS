package gwangjae.tms.performance.dao;

import java.util.List;

import gwangjae.tms.performance.dao.mapper.PerformanceMapper;
import gwangjae.tms.performance.domain.SeatInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PerformanceDaoImpl implements PerformanceDao{
	@Autowired private PerformanceMapper performanceMapper;
	
	public List<SeatInfo> getSeats(String title){
		return performanceMapper.getSeats(title);
	}
	
	public int addSeat(String seat){
		return performanceMapper.addSeat(seat);
	}
}

