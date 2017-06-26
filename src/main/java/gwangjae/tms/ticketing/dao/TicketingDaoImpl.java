package gwangjae.tms.ticketing.dao;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.dao.mapper.TicketingMapper;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketingDaoImpl implements TicketingDao {
	@Autowired TicketingMapper mapper;

	@Override
	public List<TicketSeatInfo> getAllSeatInfo(int perfId) {

		return mapper.getAllSeatInfo(perfId);
	}

	@Override
	public List<Round> getPerfSkdList(int perfId) {
		
		return mapper.getPerfSkdList(perfId);
	}
	
	@Override
	public Performance getPerfDate(int perfId){
		return mapper.getPerfDate(perfId);
	}
	
	@Override
	public TicketSeatInfo getPerfInfo(int perfId){
		return mapper.getPerfInfo(perfId);
	}
	
	@Override
	public List<SeatInfo> getPerSeatInfo(int perfId){
		return mapper.getPerfSeatInfo(perfId);
	}
}
