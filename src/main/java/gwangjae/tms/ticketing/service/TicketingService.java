package gwangjae.tms.ticketing.service;

import java.sql.Date;

public interface TicketingService {	
	public String[][] drawLayout(int hall_id);
	public Date[] getPerfSkd(int perf_if);
}
