package gwangjae.tms.ticketing.service;

import gwangjae.tms.performance.domain.Performance;
import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.sql.Date;

public interface TicketingService {	
	public TicketSeatInfo[][] getSquareSeatLayout(int perfId);
	public String[][] drawLayout(int hall_id);
	public Date[] getPerfSkd(int perf_id);
	public Performance getPerfDate(int perfId);
	public TicketSeatInfo getPerfInfo(int perfId);
}
