package gwangjae.tms.ticketing.dao;

import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.sql.Date;
import java.util.List;

public interface TicketingDao {
	public List<TicketSeatInfo> getAllSeatInfo(int perfId);
	public List<Date> getPerfSkdList(int perfId);
}
