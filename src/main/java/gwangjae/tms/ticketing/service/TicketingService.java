package gwangjae.tms.ticketing.service;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.performance.domain.Round;
import gwangjae.tms.performance.domain.SeatInfo;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.util.List;

public interface TicketingService {	
	public TicketSeatInfo[][] getSquareSeatLayout(int perfId);
	public String[][] drawLayout(int hall_id);
	public Round[] getPerfSkd(int perf_id);
	public Performance getPerfDate(int perfId);
	public TicketSeatInfo getPerfInfo(int perfId);
	public List<SeatInfo> getPerfSeatInfo(int perfId);
}
