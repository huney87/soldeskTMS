package gwangjae.tms.ticketing.dao.mapper;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.List;

public interface TicketingMapper {
	public List<TicketSeatInfo> getAllSeatInfo(int perfId);
	public List<Round> getPerfSkdList(int perfId);
	public Performance getPerfDate(int perfId);
	public TicketSeatInfo getPerfInfo(int perfId);
	public List<SeatInfo> getPerfSeatInfo(int perfId);
}
