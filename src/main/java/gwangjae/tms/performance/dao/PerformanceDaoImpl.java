package gwangjae.tms.performance.dao;

import java.util.List;

import gwangjae.tms.performance.dao.mapper.PerformanceMapper;
import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.SeatInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PerformanceDaoImpl implements PerformanceDao{
	@Autowired private PerformanceMapper performanceMapper;
	
	public List<SeatInfo> getSeats(String title){
		return performanceMapper.getSeats(title);
	}
	
	public int addSeat(int seat){
		return performanceMapper.addSeat(seat);
	}
	
	public List<Performance> getPer(String per_name){
		return performanceMapper.getPer(per_name);
	}
	
	public int addPerInfo(Performance performance){
		return performanceMapper.addPerInfo(performance);
	}
	
	public int addPerDetail(Performance performance){
		return performanceMapper.addPerDetail(performance);
	}
	
	public List<Performance> getHalls(int centerId){
		return performanceMapper.getHalls(centerId);
	}
	
	public int getLayout(int hallId){
		return performanceMapper.getLayout(hallId);
	}
}

