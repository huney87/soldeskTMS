package gwangjae.tms.ticketing.dao.mapper;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.sql.Date;
import java.util.List;

public interface TicketingMapper {
	public List<TicketSeatInfo> getAllSeatInfo(int perfId);
	public List<Date> getPerfSkdList(int perfId);
	public Performance getPerfDate(int perfId);
}
