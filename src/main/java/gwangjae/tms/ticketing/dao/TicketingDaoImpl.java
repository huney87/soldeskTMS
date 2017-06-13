package gwangjae.tms.ticketing.dao;

import gwangjae.tms.ticketing.dao.mapper.TicketingMapper;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.sql.Date;
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
	public List<Date> getPerfSkdList(int perfId) {
		
		return mapper.getPerfSkdList(perfId);
	}

}
