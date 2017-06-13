package gwangjae.tms.ticketing.service;

import gwangjae.tms.ticketing.domain.TicketSeatInfo;

import java.sql.Date;
import java.util.List;

public interface TicketingService {	
	public TicketSeatInfo[][] getSquareSeatLayout(int perfId);
	public String[][] drawLayout(int hall_id);
	public Date[] getPerfSkd(int perf_id);
}
